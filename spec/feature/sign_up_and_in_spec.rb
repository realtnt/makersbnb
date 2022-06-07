require 'spec_helper'

RSpec.describe "Registrations", type: :feature do
  before do
    user = User.new(
      email: 'jimbob@gmail.com',
      password: '1234',
      first_name: 'Jim',
      last_name: 'Bob'
    )
    user.save!
  end

  context "sign up as user and sign up with same credentials again" do
    it "redirects to an error page" do
      visit "/signup"
      fill_in "email", with: "jim@gmail.com"
      fill_in "first_name", with: "Jimbo"
      fill_in "last_name", with: "Jumbo"
      fill_in "password", with: "1234"
      fill_in "password_confirmation", with: "1234"
      click_button "Sign Up"
      expect(page).to have_content "Sign Out"

      click_link "Sign Out"

      visit "/signup"
      fill_in "email", with: "jim@gmail.com"
      fill_in "first_name", with: "Jimbo"
      fill_in "last_name", with: "Jumbo"
      fill_in "password", with: "1234"
      fill_in "password_confirmation", with: "1234"
      click_button "Sign Up"

      expect(page).to have_content "Something went wrong!"
    end
  end
  
  it "shows a sign up page" do
    visit "/"
    expect(page).to have_content "Request a Space"
  end

  it "signs up a user and logs in" do
    visit "/signup"
    fill_in "email", with: "jim@gmail.com"
    fill_in "first_name", with: "Jimbo"
    fill_in "last_name", with: "Jumbo"
    fill_in "password", with: "1234"
    fill_in "password_confirmation", with: "1234"
    click_button "Sign Up"
    expect(page).to have_content "Sign Out"
  end

  it "logs in" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
  end

  it "logs in and logs out" do
    visit "/"
    click_link "Log In"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Log In"
    expect(page).to have_content "Sign Out"
    click_link "Sign Out"
    expect(page).to have_content "Log In"
    expect(page).not_to have_content "Sign Out"
  end

end
