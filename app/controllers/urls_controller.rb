class UrlsController < ApplicationController
  def index
    @urls = Url.all
    @url = Url.new
  end

  def create
    url = Url.create(url_long)
    redirect_to url_path(url)
  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def url_long
    params.require(:url).permit(:long)
  end
end
