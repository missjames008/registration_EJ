require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do

  context 'Submitting User Info' do
    Steps 'Registering a user with user ID and password required' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in all fields' do
        fill_in 'name', with: 'Florence Belle James'
        fill_in 'address', with: '1550 Market Street'
        fill_in 'city', with: 'San Diego'
        fill_in 'state', with: 'California'
        fill_in 'zip', with: '92116'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: "florence@learnacademy.org"
        fill_in 'userid', with: "florence1"
        fill_in 'password', with: '!florence'
      end
      And 'I can submit the information' do
        click_button 'Submit'
      end
      # Then 'I can see a confirmation message' do
      #   expect(page).to have_content('User has been created')
      # end
    end
    # Steps 'Attempt to register with a preexisting username' do
    #   Given 'I am on the landing page' do
    #     visit '/'
    #   end
    #   And 'I have a user in the session' do
    #     user = User.new("name","address","city","state","zip","country","email","userid","password")
    #     session[:user] = user.to_yaml
    #   end
    #   And "I use the session user's username" do
    #     fill_in 'userid', with: 'userid'
    #     fill_in 'password', with: 'password'
    #   end
    #   Then "I am told the userid is taken" do
    #     expect(page).to have_content('User ID taken, try another')
    #   end
    # end
  end
end
