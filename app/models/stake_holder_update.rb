class StakeHolderUpdate < ApplicationRecord
  belongs_to :project
  
  has_rich_text :content
end
