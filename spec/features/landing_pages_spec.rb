require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do

  context 'Going to website' do
    Steps 'Registration content is correct and inputs exist' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome to the registration page! Please enter your information")
      end
      And 'I can input my name' do
        fill_in 'name', with: 'Florence Belle James'
      end
      And 'I can input my address' do
        fill_in 'address', with: '1550 Market Street'
      end
      And 'I can input my city' do
        fill_in 'city', with: 'San Diego'
      end
      And 'I can input my state' do
        fill_in 'state', with: 'California'
      end
      And 'I can input a postal code' do
        fill_in 'zip', with: '92116'
      end
      And 'I can input a country' do
        fill_in 'country', with: 'USA'
      end
      And 'I can input an email' do
        fill_in 'email', with: "florence@learnacademy.org"
      end
      And 'I can input a userid' do
        fill_in 'userid', with: "florence1"
      end
      And 'I can input a password' do
        fill_in 'password', with: '!florence'
      end
    end
  end
end
