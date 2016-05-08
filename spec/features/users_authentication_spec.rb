require 'rails_helper'

RSpec.feature "User Authentication", type: :feature do
  scenario "Invalid login" do
    visit '/sessions/new'

    fill_in "Email", with: "tom@tom.com"
    fill_in "Password", with: "password"
    click_button "Log In"

    expect(page).to have_text("Login failed. Invalid email or password.")
  end
end
