require "rails_helper"

describe "authenticated user" do
  scenario "can edit a link" do
    user = stub_login_user

    Link.create(url:"https://turing.io", title:"Turing", user_id: User.first.id)

    visit links_path

    click_on "Edit"

    expect(current_path).to eq(edit_link_path(user.id))

    fill_in "Url", with: "http://www.google.com"
    click_on "Submit"

    expect(page).to have_text("http://www.google.com")
    expect(page).to_not have_text("https://turing.io")

  end
end
