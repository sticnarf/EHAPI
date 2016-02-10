class ProxyController < ApplicationController
  def cover
    name = params[:name]
    curl = get_with_cookies "#{base_url}/t/#{name[0..1]}/#{name[2..3]}/#{name}.#{params[:format]}"
    send_data curl.body_str, type: curl.content_type, disposition: 'inline'
  end
end
