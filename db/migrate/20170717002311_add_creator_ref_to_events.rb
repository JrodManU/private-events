class AddCreatorRefToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :creator, foreign_key: true, index: true
  end
end
