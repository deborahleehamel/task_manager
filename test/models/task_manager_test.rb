require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def create_tasks(num)
    num.times do |i|
      task_manager.create(
        title: "title#{i+1}",
        description: "description#{i+1}"
      )
    end
  end

  def test_it_creates_a_task
    task_manager.create({
      :title       => "a title",
      :description => "a description"
    })

    task = task_manager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_finds_all_tasks
    skip
    create_tasks(3)

    assert_equal 3, task_manager.all.count

    task_manager.all.each_with_index do |task, index|
      assert_equal Task, task.class
      assert_equal "title#{index+1}", task.title
      assert_equal "description#{index+1}", task.description
    end
  end

  def test_it_updates_task
    create_tasks(2)

    updated_data = {
      :title => "updated title",
      :description => "updated description"
    }

    id = task_manager.all.last.id

    task_manager.update(updated_data, id)

    new_task = task_manager.find(id)

    assert_equal updated_data[:title], new_task.title
    assert_equal updated_data[:description], new_task.description
  end

  def test_it_deletes_a_task
    create_tasks(3)

    start_count = task.manager.all.count

    id = task_manager.all.last.id

    task_manager.delete(id)

    end_count = task_manager.all.count

    assert_equal 1, (start_count - end_count)
  end


end
