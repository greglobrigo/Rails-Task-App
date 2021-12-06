require 'rails_helper'

RSpec.describe 'Task', type: :feature do

    before do
        sign_in create(:user)
      end

    describe '1. Create' do
        it 'Should create a new task' do
            visit '/categories'
            click_link 'Add Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            click_link 'View Category'
            click_link 'Add Task'
            fill_in 'Name', with: 'Test Task'
            fill_in 'Body', with: 'Test Body'            
            click_button 'Create Task'
            expect(page).to have_content 'Task was successfully created.'                        
        end
    end   

    describe '2. Read' do
        it 'Should read a task' do
            visit '/categories'
            click_link 'Add Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            click_link 'View Category'
            click_link 'Add Task'
            fill_in 'Name', with: 'Test Task'
            fill_in 'Body', with: 'Test Body'                                    
            click_button 'Create Task'
            visit '/categories'
            click_link 'View Category'
            expect(page).to have_content 'Test Task'
            expect(page).to have_content 'Test Body'
        end
    end

    describe '3. Update' do
        it 'Should update a task' do
            visit '/categories' 
            click_link 'Add Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            click_link 'View Category'
            click_link 'Add Task'
            fill_in 'Name', with: 'Test Task'
            fill_in 'Body', with: 'Test Body'          
            click_button 'Create Task'
            visit '/categories'
            click_link 'View Category'
            click_link 'Edit'
            fill_in 'Name', with: 'Test Task --edited'
            fill_in 'Body', with: 'Test Body --edited'
            click_button 'Update Task'
            expect(page).to have_content 'Task was successfully updated.'
            expect(page).to have_content 'Test Task --edited'
            expect(page).to have_content 'Test Body --edited'
        end
    end

    describe '4. Delete' do
        it 'Should delete a task' do
            visit '/categories' 
            click_link 'Add Category'
            fill_in 'Title', with: 'Test Category'
            click_button 'Create Category'
            click_link 'View Category'
            click_link 'Add Task'
            fill_in 'Name', with: 'Test Task'
            fill_in 'Body', with: 'Test Body'          
            click_button 'Create Task'            
            click_link 'Delete'
            expect(page).to have_content 'Task was successfully destroyed.'
            expect(page).not_to have_content 'Test Task'
        end
    end

end