class Location < ApplicationRecord
  belongs_to :project
  has_many :leads
end
