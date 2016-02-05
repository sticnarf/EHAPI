class HomeController < ApplicationController
  def search
  end

  def index
    # byebug
    page = params[:page].to_i - 1
    html = Curl.get("#{base_url}/?page=#{page}") do |http|
      http.headers['Cookie'] = hentai_cookies
    end
    render json: parse_index(html.body_str)
  end
  
  private
  
  def parse_index html
    result = []
    doc = Nokogiri::HTML(html)
    entries = doc.css('.itg tr')[1..-1]
    entries.each do |entry|
      link = entry.css('.it5 a').first
      match = link.attr('href').match /\/g\/(\d+)\/([\w\d]+)/
      result << {
        type: entry.css('img').first.attr('alt'),
        published: entry.children[1].text,
        title: link.text,
        uploader: entry.css('.itu a').first.text,
        gid: match[1],
        token: match[2]
      }
    end
    result
  end
end
