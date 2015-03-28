require "rails_helper"

RSpec.describe "shorten urls", type: :feature do
  it "adds a shortened string when adding a URL" do
    visit root_path

    fill_in "url[long]", with: "http://turing.io"
    click_link_or_button "Shorten URL"

    expect(page).to have_content("turing.io")
    expect(page).to have_content(Url.last.short)

  end
end

