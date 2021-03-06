require 'spec_helper'

describe "Editing a user" do
  
  it "updates the user and redirects to the user's show page" do
    user = User.create!(user_attributes)
    
    sign_in(user)
    visit user_url(user)
    click_link 'Edit Account'

    expect(current_path).to eq(edit_user_path(user))
    expect(find_field('Username').value).to eq(user.username)

    fill_in 'Name', with: "Updated Name"
    click_button 'Update Account'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text("Updated Name")
  end

  it "does not update the user if it's invalid" do
    user = User.create!(user_attributes)
    
    sign_in(user)
    visit edit_user_url(user)
    fill_in 'Name', with: ""
    click_button 'Update Account'

    expect(page).to have_text('error')
  end
end
