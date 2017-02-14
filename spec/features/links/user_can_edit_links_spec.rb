require "rails_helper"

describe "authenticated user" do
  scenario "can edit a link" do
    stub_login_user

    Link.create(url:"https://turing.io", title:"Turing", user_id: User.first.id)

    visit links_path

    click_on "Edit"
    fill_in ""

    expect(page).to have_text("true")

  end
end
