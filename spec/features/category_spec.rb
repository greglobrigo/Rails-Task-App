require 'rails_helper'

RSpec.describe 'Category', type: :feature do

    before do
        sign_in create(:user)
      end

    describe 'Create' do
        it '1. Should create a new category' do
            visit '/categories'
            click_link 'New Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            expect(page).to have_content('Category was successfully created.')
        end
    end

    describe 'Read' do
        it '2. Should show all categories' do
            visit '/categories'
            click_link 'New Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            expect(page).to have_content('Test Category')     
        end
    end   

    describe 'Update' do
        it '3. Should edit a category' do            
            visit '/categories'
            click_link 'New Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            visit '/categories'
            click_link 'Test Category'
            click_link 'Edit Category'
            fill_in 'Title', with: 'Test Category Edited'
            click_button 'Update Category'
            expect(page).to have_content('Test Category Edited')
        end
    end

    describe 'Delete' do
        it '4. Should delete a category' do
            visit '/categories'
            click_link 'New Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            visit '/categories'
            click_link 'Test Category'
            click_link 'Delete Category'
            expect(page).to have_content('Category was successfully destroyed.')
            expect(page).to_not have_content('Test Category')
        end
    end

end
