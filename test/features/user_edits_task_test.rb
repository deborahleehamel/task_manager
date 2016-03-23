require_relative '../test_helper'

class UserEditsTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def create_task
    data = {
      title: "some title",
      description: "some description"
    }

    task_manager.create(data)
    @task = task_manager.all.last
  end

  def test_user_can_edit_task
    create_task
    #As a user
    #When I visit the index page
    visit "/tasks/#{@task.id}/edit"
    #And I update the title field
    fill_in('task[title]', with: "Changed title")
    #And I update the description field
    fill_in('task[description]', with: "Changed description")
    #And I click the submit button
    click_button('Submit')
    #Then my task should have the new values
    assert_equal '/tasks/1', current_path
    within("#tasks") do
      assert page.has_content?("Changed title")
    end
  end

  end
