class UrlsController < ApplicationController
  def index
    @urls_count = Url.sorted_by_count
    @urls_date = Url.sorted_by_date
    @url = Url.new
  end

  def create
    url = Url.find_or_create_by(url_long)
    TitleWorker.perform_async(url.long) if url
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
