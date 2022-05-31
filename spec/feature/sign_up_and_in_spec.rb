require "helpers/database_helpers"

RSpec.describe "Registrations", type: :feature do
  before(:each) do
    # DatabaseHelpers.clear_table("users")
  end

  it "shows a sign up page" do
    visit "/"
    expect(page).to have_content "Sign up to MakersBnB"
  end

  it "signs up a user and logs in" do
    visit "/"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    fill_in "password_confirmation", with: "1234"
    click_button "Sign up!"
    expect(page).to have_content "Sign out"
  end

  it "logs in" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
  end

  it "logs in and logs out" do
    visit "/"
    click_link "Login"
    fill_in "email", with: "jimbob@gmail.com"
    fill_in "password", with: "1234"
    click_button "Login"
    expect(page).to have_content "Sign out"
    click_link "Sign out"
    expect(page).to have_content "Login"
    expect(page).not_to have_content "Sign out"
  end
end
