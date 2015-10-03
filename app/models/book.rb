class Book < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :title, :isbn
	validates :isbn, uniqueness: true

  def self.search(a)
    if a
  	  #self.where("title like \'%int%\'")
  	  self.where("title like ? or isbn like ? or description like ? or author like ? or status like ?", "%#{a}%", "%#{a}%", "%#{a}%", "%#{a}%", "%#{a}%")
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    end
  end
  def self.email_search(a)
    if a
      #self.where("title like \'%int%\'")
      self.where("email like ?", "%#{a}%")
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    end
  end
end
