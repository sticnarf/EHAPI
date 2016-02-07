class HomeController < ApplicationController
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
    html = get_with_cookies "#{base_url}/?#{pm.to_query}"
    render json: parse_index(html.body_str)
  end

  def index
    pm = { page: index_page }
    html = get_with_cookies "#{base_url}/?#{pm.to_query}"
    render json: parse_index(html.body_str)
  end
  
  private
  
  def index_page
    (params[:page] || 1).to_i - 1
  end
  
  def parse_index html
    doc = Nokogiri::HTML(html)
    entries = doc.css('.itg tr')[1..-1]
    entries.map do |entry|
      link = entry.css('.it5 a').first
      match = link.attr('href').match /\/g\/(\d+)\/([\w\d]+)/
      {
        type: entry.css('.itdc img').first.attr('alt'),
        cover: entry.css('.it2').first.to_html.match(/[abcdef\d]+[\d-]+\w+\.\w+/).to_s,
        published: entry.children[1].text,
        title: link.text,
        uploader: entry.css('.itu a').first.text,
        gid: match[1],
        token: match[2]
      }
    end
  end
end
