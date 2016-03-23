require_relative '../test_helper'

class UserSeesGreetingTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_user_is_welcomed
    visit '/'

    within ("#greeting") do
      assert page.has_content?("Welcome to the TaskManager!")
    end
  end

end
