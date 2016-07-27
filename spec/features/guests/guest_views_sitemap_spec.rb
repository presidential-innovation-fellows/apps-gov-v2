require "rails_helper"

feature "A Guest Views the Sitemap" do
  scenario "and sees all their dreams come true" do
    visit "/sitemap.xml"

    expect(page).to have_css("loc", text: ENV["HOST"])
  end
end
