class AddUuidToStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :stake_holder_updates, :uuid, :string
  end
end
