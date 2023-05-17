class Task < ApplicationRecord
    belongs_to :user
    enum :status, {ready: 0, running: 1, finished: 2}
    validates :title, presence: true, length: { maximum: 256 }

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "description", "ended_at", "id", "modified_at", "status", "title", "user_id"]
    end
end
