class History < ActiveRecord::Base
  before_save :default_values
  def default_values
    self.history_status ||= 1
    self.created_by = 1
    self.updated_by = 1
    self.row_state = 1
  end
end
