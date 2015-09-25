class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :emailid
      t.string :securityq
      t.string :ans

      t.timestamps null: false
    end
  end
end
