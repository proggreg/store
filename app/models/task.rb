class Task < ApplicationRecord
  validates :title, presence: true
  validates :completed, inclusion: { in: [true, false] }
  
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end 