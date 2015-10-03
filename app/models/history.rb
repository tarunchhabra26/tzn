class History < ActiveRecord::Base

  def self.email_search(a)
    if a
      #self.where("title like \'%int%\'")
      self.where("email like ?", "#{a}")
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    end
  end

  def self.book_search(a)
    if a
      #self.where("title like \'%int%\'")
      self.where("isbn like ?", "#{a}")
      #find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    end
  end

end
