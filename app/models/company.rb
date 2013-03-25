class Company < ActiveRecord::Base
  belongs_to :subrubric
  attr_accessible :address, :description, :name, :phone
end
