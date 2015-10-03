class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	t.column :email, :string, :limit => 100, :null => false
	t.column :password, :string, :limit => 100, :null => false
	t.column :name, :string, :limit => 100, :null => false
	t.column :is_admin, :boolean, :null => false
  t.timestamps null: false
    end

    User.create :email => "admin@lib.com", :password => "admin", :name => "Preconfigured Admin", :is_admin => TRUE


  end
end
