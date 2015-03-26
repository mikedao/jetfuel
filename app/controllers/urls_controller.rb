class UrlsController < ApplicationController
  def index
    @urls = Url.all
    @url = Url.new
  end

  def create
    url = Url.create(url_long)
    redirect_to root_path
  end

  private

  def url_long
    params.require(:url).permit(:long)
  end
end
