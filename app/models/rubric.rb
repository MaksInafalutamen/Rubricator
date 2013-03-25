class Rubric < ActiveRecord::Base
  attr_accessible :name
  has_many :subrubrics,  :dependent => :destroy
end
