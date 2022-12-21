class Subscriber < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_presence_of :user_id, :project_id
end
