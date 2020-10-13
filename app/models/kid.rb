class Kid < ApplicationRecord
    has_many :behavior_logs
    has_many :users, through: :behavior_logs
end
