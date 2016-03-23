require_relative '../test_helper'

class UserDeletesTaskTest < Minitest::Test
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

  def test_user_can_delete_task
   create_task

    visit '/tasks'
    within("#tasks") do
      assert page.has_content? ("some title")
    end
    click_button("Delete")
    within("#tasks") do
      refute page.has_content? ("some title")
    end
  end
end
