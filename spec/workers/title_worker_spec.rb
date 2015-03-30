require "rails_helper"

RSpec.describe TitleWorker, type: :worker do
  it "grabs a title and saves it" do
    url = create(:url)

    TitleWorker.new.perform(url.long)

    expect(Url.last.title).to eq("301 Moved")
  end

  it "can grab a title with lowercase tags" do
    url = create(:url, long: "http://turing.io")

    TitleWorker.new.perform(url.long)

    expect(Url.last.title).to eq("Turing School of Software &amp; Design")
  end
end
