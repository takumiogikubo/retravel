class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :travel

  validates :review, presence: true

end
