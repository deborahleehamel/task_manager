# models the actual representation of actual tasks
class Task
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id          = data["id"]
    @title       = data["title"]
    @description = data["description"]
    @picture     = data["picture"]
  end
end
