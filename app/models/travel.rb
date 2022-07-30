class Travel < ApplicationRecord

  has_many :travel_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :customer

end
