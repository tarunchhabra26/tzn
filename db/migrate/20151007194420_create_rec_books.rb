class CreateRecBooks < ActiveRecord::Migration
  def change
    create_table :rec_books do |t|
      t.string :Name
      t.string :Author
      t.string :Description

      t.timestamps null: false
    end
  end
end
