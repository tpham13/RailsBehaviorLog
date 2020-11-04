class BehaviorLog < ApplicationRecord
  belongs_to :kid
  belongs_to :user
  
  validates  :time, :location, :before_behavior, :behavior_content, 
            :outcome, presence: true
  
  def self.search(search)
    if search
      kid = Kid.find_by(name: search)
      if kid
        self.where(kid_id: kid)
      else
        @behavior_logs = BehaviorLog.all
      end
    else
      @behavior_logs = BehaviorLog.all
    end 
  end 
 
end
