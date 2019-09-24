class RenameEventidToAttendedEventId < ActiveRecord::Migration[5.1]
  def change
    rename_column :attendances, :event_id, :attended_event_id
  end
end
