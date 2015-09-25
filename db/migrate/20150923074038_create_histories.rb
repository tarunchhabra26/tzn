class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :book_id
      t.integer :history_status
      t.integer :user_id
      t.string :comment
      t.integer :created_by
      t.integer :updated_by
      t.integer :row_state

      t.timestamps null: false
    end
  end
end
