class Project < ApplicationRecord
  belongs_to :user
  has_many :stake_holder_updates, dependent: :destroy
  has_many :subscribers, dependent: :destroy
 
  # scope :scope_name, -> { where(title: "Powlowski, MacGyver and Kuhn Newsletter") }

  scope :ready, -> { where.not(title: nil).where.not(website: nil).where.not(description: nil) }
  # Other scopes examples:
  # query range between 12 hours ago and now
  # scope :recent, -> { where(created_at: 12.hours.ago..Time.now )}
  # scope :draft, -> {}
  # scope :has_one_comment, -> {}

  # grab all projects that aren't the current user's
  def self.except(project)
    # Project.where.not(id: project.id)
    # where applies to project or self, so we don't need to specify.
    where.not(id: project.id)
  end
  
  def latest_stakeholder_update
    stake_holder_updates.order(created_at: :desc).first
  end

end
