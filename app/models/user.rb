class User < ActiveRecord::Base
	has_many :books
	validates_presence_of :email, :password
	validates :email, uniqueness: true


  def self.admin_search
      self.where(is_admin: true)
  end

  def self.member_search
      self.where(is_admin: false)
  end

end
