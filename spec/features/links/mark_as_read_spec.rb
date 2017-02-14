require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    stub_login_user

    Link.create(url:"https://turing.io", title:"Turing", user_id: User.first.id)

    visit links_path

    expect(page).to have_text("false")

    click_on "Mark as Read"

    expect(page).to have_text("true")

  end
end
