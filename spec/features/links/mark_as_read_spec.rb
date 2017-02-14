require "rails_helper"

# THIS TEST WORKED PRIOR TO SENDING AN AJAX CALL TO HOT READS

RSpec.describe "can mark links as read", :js => :true do
  xscenario "Mark a link as read" do
    stub_login_user

    Link.create(url:"https://turing.io", title:"Turing", user_id: User.first.id)

    visit links_path

    expect(page).to have_text("false")

    click_on "Mark as Read"

    expect(Link.first.read).to eq(true)
  end
end
