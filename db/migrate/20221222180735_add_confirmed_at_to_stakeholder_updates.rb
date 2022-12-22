class AddConfirmedAtToStakeholderUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :stake_holder_updates, :confirmed_at, :datetime, default: nil
    # default this to NIL
  end
end
