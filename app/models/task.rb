class Task < ApplicationRecord
    validates :title, presence: true, length: { maximum: 256 }
end
