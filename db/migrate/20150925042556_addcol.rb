class Addcol < ActiveRecord::Migration
  def change
  	add_column :books , :email , :string
  end
end
