class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :travels, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :customer


  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill:[width,height]).processed
  end

  def active_for_authentication?
    super && (is_active == false)
  end

  def follow(other_customer)
    unless self == other_customer
     self.relationships.find_or_create_by(follow_id: other_customer.id)
    end
  end
  def unfollow(other_customer)
    relationship = self.relationships.find_by(follow_id: other_customer.id)
    relationship.destroy if relationship
  end
  def following?(other_customer)
    self.followings.include?(other_customer)
  end

end
