class User < ActiveRecord::Base
	has_many :books
	validates_presence_of :email, :password
	validates :email, uniqueness: true

	#attr_accessible :password
  def self.admin_search
      #self.where("title like \'%int%\'")
      #self.where("is_admin = \'true\'")
      self.where(is_admin: true)
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end

  def self.member_search
      #self.where("title like \'%int%\'")
      #self.where("is_admin = \'true\'")
      self.where(is_admin: false)
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  end

end
