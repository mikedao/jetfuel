class TitleWorker
  include Sidekiq::Worker

  def perform(url)
    conn = Faraday.new
    response = conn.get url
    if response.body.match(/(?<=<TITLE>).*(?=<\/TITLE>)/)
      title = response.body.match(/(?<=<TITLE>).*(?=<\/TITLE>)/)
    else
      title = response.body.match(/(?<=<title>).*(?=<\/title>)/)
    end

    stored_url = Url.find_by(long: url)
    stored_url.update_attributes(title: title)
  end
end
