require 'rails_helper'

RSpec.feature "LoginUsers", type: :feature do

  context 'Logging a user in' do
    Steps 'Logging in with a user and password' do
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
      And 'I input user ID and password' do
        fill_in 'userid', with: "florence1"
        fill_in 'password', with: '!florence'
      end
      And 'I click the Login button' do
        click_button 'Login'
      end
      Then 'I see a page that welcomes the user' do
        expect(page).to have_content('Hello florence1')
      end
      And 'I can see all the user info on the page, except password' do
        expect(page).to have_content('Name: Florence Belle James')
        expect(page).to have_content('Address: 1550 Market Street')
        expect(page).to have_content('City: San Diego')
        expect(page).to have_content('State: California')
        expect(page).to have_content('Zip: 92116')
        expect(page).to have_content('Country: USA')
        expect(page).to have_content("Email: florence@learnacademy.org")
      end
    end

    Steps 'Logging in with a wrong user and password' do
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
      And 'I input a wrong user ID or password' do
        fill_in 'userid', with: "florence2"
        fill_in 'password', with: 'florence'
      end
      And 'I click the Login button' do
        click_button 'Login'
      end
      Then 'I go back to the login page' do
        fill_in 'userid', with: "florence2"
        fill_in 'password', with: 'florence'
      end
      And 'There is an error message on the login page' do
        expect(page).to have_content('Log in failed, try again')
      end
    end
  end
end
