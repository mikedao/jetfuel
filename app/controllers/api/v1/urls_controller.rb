class Api::V1::UrlsController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Url.find_by(long: params[:long])
  end
end
