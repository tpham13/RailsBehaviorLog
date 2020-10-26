class BehaviorLog < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :kid
  validates  :date, :time, :location, :before_behavior, :behavior_content, 
            :outcome, presence: true


  # def user_attributes=(user_attributes)
  #   self.user = User.find_or_create_by(username: user_attributes[:username]) unless user_attributes[:username].blank?
  # end

  # def kid_attributes=(kid_attributes)
  #   kid_attributes.values.each do |kid_attribute|
  #     if kid_attribute["name"].present?
  #       kid = Kid.find_or_create_by(kid_attribute)
  #       self.kids << kid
  #     end 
  #   end 
  # end 
end
