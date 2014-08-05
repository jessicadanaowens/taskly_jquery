require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    visit signin_path
    click_on "Login"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")

    #user can edit a task

    first('.task-list').click_link('Edit')
    # expect(page).to have_content("Household Chores")
    fill_in "task_list_name", with: "whatever"

    click_button "Edit Task List"
    expect(page).to have_content "whatever"

    #user can add new task lists

    click_on "Add Task List"
    expect(page).to have_content("Name")
  end

end