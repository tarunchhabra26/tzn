class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :authors
      t.boolean :status
      t.string :return_date

      t.timestamps null: false
    end
  end
end
