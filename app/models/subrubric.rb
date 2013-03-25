class Subrubric < ActiveRecord::Base
  belongs_to :rubric
  attr_accessible :name
  has_many :companys,  :dependent => :destroy
end
