class ApplicationController < ActionController::API
  def base_url
    "http://exhentai.org"
  end
  
  def hentai_cookies
    # ATTENTION: POSTGRESQL ONLY!!!
    user = User.order('RANDOM()').where(exhentai: true).first
    "ipb_member_id=#{user.member_id};ipb_pass_hash=#{user.pass_hash};igneous=#{user.igneous}"
  end
  
  def get_with_cookies url
    Curl.get url do |http|
      http.headers['Cookie'] = hentai_cookies
    end
  end
end
