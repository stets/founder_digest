class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }

  has_many :projects
  has_many :subscribers
  has_many :stake_holder_updates, through: :projects

  before_create :generate_auth_code
  # call back
  def generate_auth_code
    self.auth_code = SecureRandom.hex(20)
  end

end
