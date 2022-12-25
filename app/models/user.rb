class User < ApplicationRecord
  include Signupable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }


  has_many :projects, dependent: :destroy
  has_many :subscribers,  dependent: :destroy
  
  has_many :stake_holder_updates, through: :projects

  before_create :generate_auth_code
  # call back
  def generate_auth_code
    # todo: make this secure so that users can't use it over and over again
    # eg: generate it again or expire it out
    self.auth_code = SecureRandom.hex(20)
  end

  def default_project
    projects.order(created_at: :asc).first
  end

  def name
    "#{first_name} #{last_name}"
  end

  def finished_onboarding?
    stripe_subscription_id?
  end

end
