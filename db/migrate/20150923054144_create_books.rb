class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.string :authors
      t.string :description
      t.string :status
      t.datetime :return_date
      t.integer :created_by
      t.integer :last_updated_by
      t.integer :row_state

      t.timestamps null: false
    end
  end
end
