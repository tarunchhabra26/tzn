class AddColumnNameToBook < ActiveRecord::Migration
  def change
    add_column :books, :send_mail_notification, :string
    add_column :books, :is_recommendation, :boolean
  end
end
