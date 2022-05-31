require "helpers/database_helpers"

RSpec.describe "Animals Feature (Example)", type: :feature do
  before(:each) do
    DatabaseHelpers.clear_table("animals")
  end

  it "starts with an empty list of examples" do
    visit "/animals"
    expect(page).to have_content "There are no animals."
  end

  it "adds and lists animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    expect(page).to have_content "Frog"
  end

  it "adds and lists multiple animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"
    expect(page).to have_content "Frog"
    expect(page).to have_content "Cat"
    expect(page).to have_content "Dog"
  end

  it "deletes animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"

    click_button "Delete Cat"

    expect(page).to have_content "Frog"
    expect(page).not_to have_content "Cat"
    expect(page).to have_content "Dog"
  end

  it "updates animals" do
    visit "/animals"
    click_link "Add Animal"
    fill_in "Species", with: "Frog"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Cat"
    click_button "Add Animal"
    click_link "Add Animal"
    fill_in "Species", with: "Dog"
    click_button "Add Animal"

    click_link "Edit Cat"
    fill_in "Species", with: "Zebra"
    click_button "Update Animal"

    expect(page).to have_content "Frog"
    expect(page).not_to have_content "Cat"
    expect(page).to have_content "Zebra"
    expect(page).to have_content "Dog"
  end
end
