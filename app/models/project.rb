class Project < ApplicationRecord
  has_many :locations
  #has_many :leads, through :locations

end
