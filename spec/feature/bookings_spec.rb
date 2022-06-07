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
    expect(page).to have_content "Availability"
    fill_in "title", with: "Mansion"
    fill_in "description", with: "Big house"
    fill_in "price", with: "150"
    fill_in "date_from", with: "31/10/2022"
    fill_in "date_to", with: "01/12/2022"
    click_button "List my space"
    expect(page).not_to have_content "Something went wrong!"
    click_link "Sign Out"
    
    click_link "Log In"
    fill_in "email", with: "garypaul@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"

    click_link "List a Space"
    fill_in "title", with: "Hut"
    fill_in "description", with: "Off the beaten track"
    fill_in "price", with: "10"
    fill_in "date_from", with: "31/10/2023"
    fill_in "date_to", with: "01/12/2023"
    click_button "List my space"
    expect(page).not_to have_content "Something went wrong!"

    click_link "Spaces"
    
    click_link "space-link-0"
    click_link "Request to book"
    fill_in "Choose date:", with: "02/01/2022"
    click_button "Submit request"
    expect(page).to have_content "Requests I have made"
    expect(page).to have_content "Mansion"
    # expect(page).to have_content "31-Oct-2022"
    expect(page).not_to have_content "Hut"
    expect(page).not_to have_content "31/10/2023"
    click_link "Sign Out"

    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    click_link "Spaces"
    click_link "space-link-1"
    click_link "Request to book"
    fill_in "Choose date:", with: "21/06/2022"
    click_button "Submit request"
    expect(page).to have_content "Requests I have made"
    expect(page).to have_content "Hut"
    # expect(page).to have_content "2022-06-21"
  end
end
