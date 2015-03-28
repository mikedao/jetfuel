class RedirectController < ApplicationController
  def show
    url = Url.find_by(short: params[:slug])
    if url
      url.increment
      redirect_to url.long
    else
      redirect_to root_path
    end
  end
end
