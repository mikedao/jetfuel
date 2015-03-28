require 'rails_helper'

RSpec.describe RedirectController, :type => :controller do
  it "redirects to a site" do
    url = create(:url)

    get :show, slug: url.short

    expect(response.status).to eq(302)
    expect(response.body).to include("redirect")
    expect(response.body).to include(url.long)
  end
end
