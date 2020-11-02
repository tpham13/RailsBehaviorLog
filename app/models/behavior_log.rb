class BehaviorLog < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  
  validates  :date, :time, :location, :before_behavior, :behavior_content, 
            :outcome, presence: true
  
  scope :alpha, -> { order(name: :asc)}
 
end
