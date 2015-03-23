require "rails_helper"

RSpec.describe UrlsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with a 200 code" do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
