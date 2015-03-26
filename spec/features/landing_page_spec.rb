require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  it "has the title on the landing page" do
    visit root_path

    expect(page).to have_content("JetFuel")
  end

  it "shows a saved url on the landing page" do
    create(:url)

    visit root_path

    expect(page).to have_content("google.com")
  end
end

RSpec.describe "Adding URLs", type: :feature do
  it "can add a url and then bring you to the show page" do
    visit root_path

    fill_in "url[long]", with: "http://turing.io"
    click_link_or_button "Shorten URL"

    expect(page).to have_content("turing.io")
  end
end
