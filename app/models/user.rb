class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, :format => { :with => /([^@\s]+)@([\w]+)\.([a-zA-Z]{2,})/, :message => "Invalid email" }
  validates :password, length: { in: 6..10 }
end
