require 'rails_helper'

describe "As a logged in user visiting the links index page" do
  it "I should see a sign out button but not a sign in button" do

    User.create(email: "test@test.com", password: "pass")

    visit login_path
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "pass"

    click_on "Login"

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end
  it "I should be able to logout" do

    User.create(email: "test@test.com", password: "pass")

    visit login_path
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "pass"

    click_on "Login"
    click_on "Sign Out"

    expect(current_path).to eq(root_path)
  end
end
