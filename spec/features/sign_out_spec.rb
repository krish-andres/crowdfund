require 'spec_helper'

describe "Signing Out" do
  
  it "removes the user id from the session" do
    user = User.create!(user_attributes)

    sign_in(user)
    click_link 'Sign Out'

    expect(page).to have_text("Signed Out!")
    expect(page).not_to have_link("Sign Out")
    expect(page).to have_link("Sign In")
  end
end
