class Travel < ApplicationRecord

  has_many :travel_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  belongs_to :customer

  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  enum destination: {
    hokkaido: 0,
    aomori: 1,
    iwate: 3,
    miyagi: 4,
    akita: 5,
    yamagata: 6,
    fukushima: 7,
    ibaraki: 8,
    tochigi: 9,
    gunma: 10,
    saitama: 11,
    chiba: 12,
    tokyo: 13,
    kanagawa: 14,
    niigata: 15,
    toyama: 16,
    ishikawa: 17,
    fukui: 18,
    yamanashi: 19,
    nagoya: 20,
    gifu: 21,
    shizuoka: 22,
    aichi: 23,
    mie: 24,
    shiga: 25,
    kyoto: 26,
    osaka: 27,
    hyogo: 28,
    nara: 29,
    wakayama: 30,
    tottori: 31,
    shimane: 32,
    okayama: 33,
    hiroshima: 34,
    yamaguchi: 35,
    tokushima: 36,
    kagawa: 37,
    ehime: 38,
    kochi: 39,
    fukuoka: 40,
    saga: 41,
    nagasaki: 42,
    oita: 43,
    kumamoto: 44,
    miyazaki: 45,
    kagoshima: 46,
    okinawa: 47,

    # https://www.tourism.jp/tourism-database/stats/outbound/ （JTB総合研究所）参照

    # 韓国
    korea: 48,
    # 台湾
    taiwan: 49,
    # 香港
    hongkong: 50,
    # マカオ
    macau: 51,
    # タイ
    thailand: 52,
    # マレーシア
    malaysia: 53,
    # シンガポール
    shingapore: 54,
    # バリ（インドネシア）
    bali: 55,
    # カナダ
    canada: 56,
    # アメリカ
    america: 57,
    # ハワイ（アメリカ）
    hawaii: 58,
    # グアム
    guam: 59,
    # オーストラリア
    australia: 60,
    # ニュージーランド
    newzealand: 61,
    # ドイツ
    germany: 62,
    # スペイン
    spain: 63,
    # オーストリア
    austria: 64,
    # その他
    another: 65

  }

end
