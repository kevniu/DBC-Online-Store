require 'rails_helper'

RSpec.feature "Product Management", type: :feature do
  scenario "Create a new product" do
    visit '/products/new'

    fill_in "Name", with: "My Product"
    fill_in "Description", with: "This a description"
    fill_in "Price", with: 300.33
    click_button "Save"

    expect(page).to have_text("HTTP Basic: Access denied.")
  end
end


