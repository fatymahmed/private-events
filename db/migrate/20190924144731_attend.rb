class Attend < ActiveRecord::Migration[5.1]
  def change
    rename_column :attendances, :user_id, :attendee_id
  end
end
