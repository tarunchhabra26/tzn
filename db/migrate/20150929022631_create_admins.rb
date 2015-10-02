class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.string :sec_que
      t.string :ans

      t.timestamps null: false
    end
  end
end
