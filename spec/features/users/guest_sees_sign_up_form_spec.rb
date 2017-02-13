require 'spec_helper'

describe "an unauthenticated user" do
  context "clicking sign up from root page" do
    it "is taken to a form to sign up" do

      visit root_path
      click_link("Sign Up")

      expect(current_path).to eq(new_user_path)

      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("Password confirmation")

    end
  end
end
