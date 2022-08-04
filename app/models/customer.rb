class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :travels, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :relationship
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'relationship_id'
  has_many :followers, through: :reverse_of_follows, source: :customer


  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width,height]).processed
  end

  def active_for_authentication?
    super && (is_active == false)
  end


  def follow(other_customer)
    unless self == other_customer
      self.follows.find_or_create_by(relationship_id: other_user.id)
    end
  end

  def unfollow(other_customer)
    follow = self.follows.find_by(relationship_id: other_customer.id)
    follow.destroy if follow
  end

  def following?(other_customer)
    self.followings.include?(other_customer)
  end


end
