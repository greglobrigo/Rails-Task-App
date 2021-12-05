require 'rails_helper'

RSpec.describe 'Auth', type: :feature do
    
    describe 'Home page' do
        it 'Should contain the log in and sign up page' do
        visit '/'
        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_content('Log in')
        expect(page).to have_content('Password')    
        expect(page).to have_content('Sign up')
        expect(page).to have_content('Forgot your password?')        
        end
    end

    describe 'Sign up' do
     it 'Should create a new user' do
        visit '/'
        click_link 'Sign up'
        fill_in 'Email', with: 'example@email.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')
        end
    end

    describe 'Log in' do    
     it 'Should log in a user' do
         user = create(:user)
         visit '/'         
         fill_in 'Email', with: user.email
         fill_in 'Password', with: user.password
         click_button 'Log in'
         expect(page).to have_content('Signed in successfully.')
        end
    end

    describe 'Log out' do
        it 'Should log out a user' do                    
            user = create(:user)
            visit '/'
            fill_in 'Email', with: user.email
            fill_in 'Password', with: user.password
            click_button 'Log in'
            visit '/'
            click_link 'Logout'
            expect(page).to have_content('You need to sign in or sign up before continuing.')
        end
    end
    
    describe 'Unauthenticated user' do
        it 'Should not be able to access the website' do
            visit '/categories'
            expect(page).to have_content('You need to sign in or sign up before continuing.')
        end
    end
   
end
