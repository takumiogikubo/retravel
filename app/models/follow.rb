class Follow < ApplicationRecord

  belongs_to :customer
  belongs_to :relationship, class_name: 'customer'

  validates :customer_id, presence: true
  validates :relationship_id, presence: true

end
