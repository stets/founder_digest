class Project < ApplicationRecord
  belongs_to :user
  has_many :stake_holder_updates
  has_many :subscribers
 
  # scope :scope_name, -> { where(title: "Powlowski, MacGyver and Kuhn Newsletter") }

  scope :ready, -> { where.not(title: nil).where.not(website: nil).where.not(description: nil) }
  # query range between 12 hours ago and now
  scope :recent, -> { where(created_at: 12.hours.ago..Time.now )}
  scope :draft, -> {}
  scope :has_one_comment, -> {}

  # grab all projects that aren't the current users
  def self.except(project)
    Project.where.not(id: project.id)
  end

end
