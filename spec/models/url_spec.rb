require "rails_helper"

RSpec.describe Url, type: :model do
  it "has a long url" do
    url = create(:url)

    expect(url.long).to eq("http://google.com")
  end

  it "starts with a count of zero" do
    url = create(:url)

    expect(url.count).to eq 0
  end
end
