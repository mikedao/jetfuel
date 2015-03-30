require 'rails_helper'

RSpec.describe Api::V1::UrlsController, :type => :controller do
  describe "GET #show" do
    it "responds with the proper URL info" do
      url = create(:url)

      get :show, format: :json

      expect(response).to be_success
    end
  end
end
