class User < ApplicationRecord
    has_many :behavior_logs
    has_many :kids, through: :behavior_logs
    has_secure_password
end
