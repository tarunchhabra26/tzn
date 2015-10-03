class CreateBooks < ActiveRecord::Migration
 
  def change
    create_table :books do |t|
  t.column :isbn, :string, :limit => 100, :null => false
  t.column :title, :string, :limit => 100, :null => false
  t.column :author, :string, :limit => 100
  t.column :description, :text
  t.column :status, :boolean, :null => false
    end
  end
end
