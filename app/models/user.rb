class User < ApplicationRecord
    has_many :behavior_logs, dependent: :destroy
    has_many :kids, through: :behavior_logs
    has_secure_password
    validates :username, :email,  presence: true, uniqueness: true
    validates :password, presence: true 

end
