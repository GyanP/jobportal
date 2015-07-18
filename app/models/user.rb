class User < ActiveRecord::Base
  belongs_to :role
  has_many :jobs
  has_many :hirings
end
