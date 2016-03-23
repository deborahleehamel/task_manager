require_relative '../test_helper'

class UserCreatesNewTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

def test_user_creates_new_task_data
  #As a user
    #When I visit the home page
    visit '/'
    #And I click on "New Task"
    click_link("New Task")
    #And I fill in a task title
    fill_in('task[title]', with: "New title for my task")
    #And I fill in the task description
    fill_in('task[description]', with: "New description for my task")
    #And I click submit
    click_button ('Submit')
    #Then I should see my task
    assert_equal ('/tasks'), current_path

    within ('#tasks') do
      assert page.has_content?("New title for my task")
    end
  end

end
