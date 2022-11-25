class Travel < ApplicationRecord

  has_many :travel_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :customer

  has_one_attached :image

  validates :travel_start, presence: true
  validates :travel_finish, presence: true
  validates :travel_title, presence: true
  validates :destination, presence: true
  validate :start_finish_check

  def start_finish_check
    errors.add(:travel_finish,"の日付を正しく記入してください。")unless
    unless travel_start == nil or travel_finish == nil
    self.travel_start <= self.travel_finish
    end
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/summer.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  enum destination: {
    hokkaido: 0,
    aomori: 1,
    iwate: 2,
    miyagi: 3,
    akita: 4,
    yamagata: 5,
    fukushima: 6,
    ibaraki: 7,
    tochigi: 8,
    gunma: 9,
    saitama: 10,
    chiba: 11,
    tokyo: 12,
    kanagawa: 13,
    niigata: 14,
    toyama: 15,
    ishikawa: 16,
    fukui: 17,
    yamanashi: 18,
    nagano: 19,
    gifu: 20,
    shizuoka: 21,
    aichi: 22,
    mie: 23,
    shiga: 24,
    kyoto: 25,
    osaka: 26,
    hyogo: 27,
    nara: 28,
    wakayama: 29,
    tottori: 30,
    shimane: 31,
    okayama: 32,
    hiroshima: 33,
    yamaguchi: 34,
    tokushima: 35,
    kagawa: 36,
    ehime: 37,
    kochi: 38,
    fukuoka: 39,
    saga: 40,
    nagasaki: 41,
    oita: 42,
    kumamoto: 43,
    miyazaki: 44,
    kagoshima: 45,
    okinawa: 46,

    # https://www.tourism.jp/tourism-database/stats/outbound/ （JTB総合研究所）参照

    # 韓国
    korea: 47,
    # 台湾
    taiwan: 48,
    # 香港
    hongkong: 49,
    # マカオ
    macau: 50,
    # タイ
    thailand: 51,
    # マレーシア
    malaysia: 52,
    # シンガポール
    shingapore: 53,
    # バリ（インドネシア）
    bali: 54,
    # カナダ
    canada: 55,
    # アメリカ
    america: 56,
    # ハワイ（アメリカ）
    hawaii: 57,
    # グアム
    guam: 58,
    # オーストラリア
    australia: 59,
    # ニュージーランド
    newzealand: 60,
    # ドイツ
    germany: 61,
    # スペイン
    spain: 62,
    # オーストリア
    austria: 63,
    # その他
    another: 64
  }

  def good_by?(customer)
    goods.exists?(customer_id: customer.id)
  end

end
