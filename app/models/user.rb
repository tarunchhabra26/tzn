class User < ActiveRecord::Base
  validates :fname, presence:true
  validates :lname, presence:true
  validates :emailid, presence:true
              {minimum:5}
  validates :securityq, presence:true
  validates :ans, presence:true
end
