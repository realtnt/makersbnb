require 'spec_helper'

RSpec.describe "Bookings", type: :feature do
  before do
    user1 = User.new(
      email: 'jimbob@gmail.com',
      password: '1234',
      first_name: 'Jim',
      last_name: 'Bob'
    )
    user1.save!

    user2 = User.new(
      email: "garypaul@gmail.com",
      password: '1234',
      first_name: 'Gary',
      last_name: 'Paul'
    )
    user2.save!
  end

  it "only lists requests I have made" do
    visit '/'
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"

    click_link "List a Space"
    fill_in "Name", with: "Mansion"
    fill_in "Description", with: "Big house"
    fill_in "Price per night", with: "150"
    fill_in "Available from:", with: "31/10/2022"
    fill_in "Available until:", with: "01/12/2022"
    click_button "List my space"
    click_link "Sign Out"
    
    click_link "Log In"
    fill_in "email", with: "garypaul@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"

    click_link "List a Space"
    fill_in "Name", with: "Hut"
    fill_in "Description", with: "Off the beaten track"
    fill_in "Price per night", with: "10"
    fill_in "Available from:", with: "31/10/2022"
    fill_in "Available until:", with: "01/12/2022"
    click_button "List my space"
    save_and_open_page

    click_link "Spaces"
    
    click_link "space-link-0"
    click_link "Request to book"
    fill_in "Choose date:", with: "02/01/2022"
    click_button "Request Space"
    expect(page).to have_content "Requests I have made"
    expect(page).to have_content "Mansion"
    expect(page).to have_content "31/05/2021"
    expect(page).not_to have_content "Hut"
    expect(page).not_to have_content "01/07/2022"
    click_link "Sign Out"

    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    click_link "Spaces"
    click_link "space-link/2"
    click_link "Request to book"
    fill_in "Choose date:", with: "21/06/2022"
    click_button "Request Space"
    expect(page).to have_content "Requests I have made"
    expect(page).to have_content "Hut"
    expect(page).to have_content "2022-06-21"
  end
end
