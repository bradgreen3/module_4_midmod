require 'rails_helper'

describe "when a user goes to root page and clicks sign in" do
  context "they are redirected and can log in with their credentials" do
    it "and be redirected to links after logging in" do
      user = User.create(email: "test@test.com", password: "pass", password_confirmation: "pass")

      visit root_path
      click_on "Log In"
      fill_in "Email", with: "test@test.com"
      fill_in "Password", with: "pass"

      click_on "Login"

      expect(current_path).to eq(links_path)

      end
    end
  end
