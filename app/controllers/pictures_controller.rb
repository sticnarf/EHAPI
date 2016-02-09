class PicturesController < ApplicationController
  def index
    g = Gallery.find_by(gid: params[:gid])
    render json: g.pictures, only: [:gid, :page, :startkey]
  end
  
  def show
    p = Picture.find_by(gid: params[:gid], page: params[:page])
    curl = get_with_cookies("#{base_url}/s/#{p.startkey}/#{p.gid}-#{p.page}")
    html = Nokogiri::HTML(curl.body_str)
    p.url = html.css('#img').attr('src')
    p.save
    render json: p, except: [:id, :updated_at, :created_at]
  end
end
