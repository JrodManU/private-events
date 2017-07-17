class CreateAttendences < ActiveRecord::Migration[5.1]
  def change
    create_table :attendences, index: false do |t|
      t.references :users, :attendee, foreign_key: true, index: true
      t.references :events, :attended_event, foreign_key: true, index: true
      t.timestamps
    end
  end
end
