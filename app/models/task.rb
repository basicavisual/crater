class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy

  scope :completed, -> { where.not( completed: nil ) }
  scope :priority, -> { order(priority: :desc) }

end
