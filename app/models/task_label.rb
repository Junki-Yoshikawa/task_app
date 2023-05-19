class TaskLabel < ApplicationRecord
  belongs_to :task
  belongs_to :label

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "label_id", "task_id", "updated_at"]
  end
end
