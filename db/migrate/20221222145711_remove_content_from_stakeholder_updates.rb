class RemoveContentFromStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    remove_column :stake_holder_updates, :content, :string
  end
end
