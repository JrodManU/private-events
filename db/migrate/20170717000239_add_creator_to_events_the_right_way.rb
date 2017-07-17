class AddCreatorToEventsTheRightWay < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :creator
    add_foreign_key :events, :users, column: :creator
    add_index :events, :creator
  end
end
