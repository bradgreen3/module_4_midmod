require 'rails_helper'

describe "an authenticated user" do
  context "visiting links index page" do
    it "sees a form to submit a link" do

      stub_login_user

      visit links_path

      expect(page).to have_text("Url")
      expect(page).to have_text("Title")

    end
  end
end

# form on index page
# on submit of form, info is ajaxed over to POST api/v1/links with current_user, URL, and title
# in api/v1/links controller create method, a url is created in database
