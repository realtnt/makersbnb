require 'spec_helper'

RSpec.describe "Spaces", type: :feature do
  before do
    user = User.new(
      email: 'jimbob@gmail.com',
      password: '1234',
      first_name: 'Jim',
      last_name: 'Bob'
    )
    user.save!
  end

  it "logs in and shows a list of spaces" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
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

  it "shows no spaces found" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
    click_link "Spaces"
    expect(page).to have_content "There are no spaces available."
  end

  it "shows a list of spaces" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
    click_link "List a Space"
    fill_in "Name", with: "Space"
    fill_in "Description", with: "the final frontier"
    fill_in "Price per night", with: "150"
    fill_in "Available from:", with: "31/05/2022"
    fill_in "Available until:", with: "01/07/2022"
    click_button "List my space"
    click_link "Spaces"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    click_link "space-link"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    expect(page).to have_content "150"
    expect(page).to have_content "Tue, 31-May-2022"
    expect(page).to have_content "Fri, 01-Jul-2022"
  end

  it "can request a listed space and list out requested spaces" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
    click_link "List a Space"
    fill_in "Name", with: "Space"
    fill_in "Description", with: "the final frontier"
    fill_in "Price per night", with: "150"
    fill_in "Available from:", with: "31/05/2021"
    fill_in "Available until:", with: "01/07/2022"
    click_button "List my space"
    click_link "Spaces"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    click_link "space-link"
    expect(page).to have_content "Space"
    expect(page).to have_content "the final frontier"
    expect(page).to have_content "150"
    expect(page).to have_content "Mon, 31-May-2021"
    expect(page).to have_content "Fri, 01-Jul-2022"
    click_link "Request to book"
    expect(page).to have_content "Request to book: Space"
    expect(page).to have_content "Choose date:"
    fill_in "Choose date:", with: "02/01/2022"
    click_button "Request Space"
    expect(page).to have_content "Requested spaces"
    expect(page).to have_content "Space"
    expect(page).to have_content "2022-01-02"
  end
end
