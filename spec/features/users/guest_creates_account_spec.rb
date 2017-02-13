require 'rails_helper'

describe "a not logged in user" do
  it "can create an account" do
    visit new_user_path

    fill_in 'Email', with: "brad@test.com"
    fill_in 'Password', with: "pass"
    fill_in 'Password Confirmation', with: "pass"

    click_button "Create Account"

    user = User.find_by(email: "brad@test.com")

    expect(current_path).to eq(links_path)

    end
  end
