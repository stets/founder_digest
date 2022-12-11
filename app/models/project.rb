class Project < ApplicationRecord
  belongs_to :user
  has_many :stake_holder_updates
  has_many :subscribers
end
