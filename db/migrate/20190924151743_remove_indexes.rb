class RemoveIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index "attendances", name: "index_attendances_on_attendee_id"
  end
end
