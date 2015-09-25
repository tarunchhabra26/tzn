class Book < ActiveRecord::Base
  validates :isbn, presence: true, numericality: :integer
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :authors, presence: true,
            length: { minimum: 5 }
  before_save :default_values
  def default_values
    self.status ||= 1
    self.created_by =1
    self.last_updated_by = 1
    self.row_state = 1
    self.return_date = Time.now
  end
end
