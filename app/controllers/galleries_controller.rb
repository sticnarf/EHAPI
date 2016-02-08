class GalleriesController < ApplicationController
  def search
    pm = {
      page: index_page,
      f_search: params[:search],
      f_doujinshi: params[:doujinshi] || 1,
      f_manga: params[:manga] || 1,
      f_artistcg: params[:artistcg] || 1,
      f_gamecg: params[:gamecg] || 1,
      f_western: params[:western] || 1,
      :'f_non-h' => params[:'non-h'] || 1,
      f_imageset: params[:imageset] || 1,
      f_cosplay: params[:cosplay] || 1,
      f_asianporn: params[:asianporn] || 1,
      f_misc: params[:misc] || 1
    }
    curl = get_with_cookies "#{base_url}/?#{pm.to_query}"
    render json: parse_index(curl.body_str)
  end

  def index
    pm = { page: index_page }
    curl = get_with_cookies "#{base_url}/?#{pm.to_query}"
    render json: parse_index(curl.body_str)
  end
  
  def show
    curl = get_with_cookies "#{base_url}/g/#{params[:gid]}/#{params[:token]}/"
    gallery = Gallery.find_or_initialize_by(gid: params[:gid], token: params[:gid])
    render json: parse_gallery(gallery, curl.body_str), except: [:id, :created_at, :updated_at]#, include: :pictures
  end
  
  private
  
  def index_page
    (params[:page] || 1).to_i - 1
  end
  
  def parse_gallery gallery, html
    doc = Nokogiri::HTML(html)
    tr = doc.css('#gdd tr')
    gallery.title = doc.css('#gn').text
    gallery.uploader = doc.css('#gdn a').text
    gallery.sort = doc.css('#gdc img').attr('alt')
    gallery.posted_at = Time.parse(tr[0].css('.gdt2').text)
    gallery.language = tr[3].css('.gdt2').text.full_strip
    gallery.file_size = tr[4].search('.gdt2').xpath('text()').text.full_strip
    gallery.length = tr[5].css('.gdt2').text.to_i
    gallery.rating = doc.css('#rating_label').text.match(/[\d\.]+/).to_s.to_f
    gallery.cover = doc.css('#gd1 img').attr('src')
    gallery.tags = doc.css('#taglist a').map { |x| x.text.split('|').map { |y| y.full_strip } }.flatten
    gallery.save
    doc.css('#gdt .gdtm').each do |div|
      page = div.css('img').attr('alt').to_s.to_i
      pic = Picture.find_or_initialize_by(gallery_id: gallery.id, page: page)
      pic.startkey = div.css('a').attr('href').to_s.match(/\/s\/([a-f\d]+)\//)[1]
      pic.save
    end
    next_page = doc.css('ptt a').find { |x| x.text == '>' }
    if next_page
      parse_gallery gallery, get_with_cookies(next_page.attr('href')).body_str
    else
      gallery
    end
  end
  
  def parse_index html
    doc = Nokogiri::HTML(html)
    entries = doc.css('.itg tr')[1..-1]
    entries.map do |entry|
      link = entry.css('.it5 a').first
      match = link.attr('href').match /\/g\/(\d+)\/([\w\d]+)/
      {
        sort: entry.css('.itdc img').first.attr('alt'),
        cover: entry.css('.it2').first.to_html.match(/[abcdef\d]+[\d-]+\w+\.\w+/).to_s,
        posted_at: entry.children[1].text,
        title: link.text,
        uploader: entry.css('.itu a').first.text,
        gid: match[1],
        token: match[2]
      }
    end
  end
end
