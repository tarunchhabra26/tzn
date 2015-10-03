class CreateHistories < ActiveRecord::Migration
  def change
    
    create_table :histories do |t|

      t.column :isbn, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null => false
      t.column :checkout, :datetime
      t.column :checkin, :datetime
      t.column :status, :string, :limit => 100, :null => false

      t.timestamps null: false
    end
  end
end
