class ChangeReferenceNamesInAttendance < ActiveRecord::Migration[5.1]
  def change
    rename_column :attendances, :event_id, :attended_event_id
    rename_column :attendances, :user_id, :attendee_id
  end
end
