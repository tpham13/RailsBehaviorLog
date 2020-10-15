class BehaviorLog < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  accepts_nested_attributes_for :user
end
