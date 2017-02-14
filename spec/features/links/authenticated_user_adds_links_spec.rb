require 'rails_helper'

RSpec.describe "authenticated user", :js => :true do
  context "submitting a valid link" do
    it "sees only their link displayed on page" do

      other_user = User.create(email: "blah@blah.com", password: "pass")
      other_link = Link.create(url: "http://yahoo.com", title: "Yahoo", user_id: other_user.id)

      stub_login_user

      visit links_path

      fill_in 'url_', with: "http://google.com"
      fill_in 'title_', with: "Google"

      # submit_form
      click_on('Submit')

      expect(page).to have_content("Google")
      expect(page).to have_content("http://google.com")
      expect(page).to have_content("false")

      expect(page).to_not have_content("Yahoo")
    end
  end
end
