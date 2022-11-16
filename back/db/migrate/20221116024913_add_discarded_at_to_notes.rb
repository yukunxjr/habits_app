class AddDiscardedAtToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :discarded_at, :datetime
    add_index :notes, :discarded_at
  end
end
