class AddCreatorToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :creator, :string
    add_foreign_key :events, :users, column: :creator
    add_index :events, :creator
  end
end
