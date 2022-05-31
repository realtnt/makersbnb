require "helpers/database_helpers"

RSpec.describe "Spaces", type: :feature do
  before(:each) do
    # DatabaseHelpers.clear_table("users")
  end

  it "logs in and lists a space" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
    click_link "List a Space"
    expect(page).to have_content "Name"
    expect(page).to have_content "Description"
    expect(page).to have_content "Price per night"
    expect(page).to have_content "Available from:"
    expect(page).to have_content "Available until:"
  end

  it "shows a list of spaces" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
    click_link "List a Space"
    fill_in "Name", with: "Space"
    fill_in "Description", with: "the final frontier"
    fill_in "Price per night", with: "150"
    fill_in "Available from:", with: "01/01/2023"
    fill_in "Available until:", with: "10/01/2023"
    click_button "List my space"
    click_link "Spaces"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
  end

  xit "shows no spaces found" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
    click_link "Spaces"
    expect(page).to have_content "No available spaces found."
  end

  it "shows a list of spaces" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
    click_link "List a Space"
    fill_in "Name", with: "Space"
    fill_in "Description", with: "the final frontier"
    fill_in "Price per night", with: "150"
    fill_in "Available from:", with: "01/01/2023"
    fill_in "Available until:", with: "10/01/2023"
    click_button "List my space"
    click_link "Spaces"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    click_link "space-link"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    expect(page).to have_content "150"
    expect(page).to have_content "01/01/2023"
    expect(page).to have_content "10/01/2023"
  end
end