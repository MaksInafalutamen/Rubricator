class User < ActiveRecord::Base
  attr_accessible :name, :pass
  validates(:name, :presence => true, :length   => {:minimum => 4, :maximum => 30 }, :uniqueness => true)
  validates(:pass, :presence => true)
end
