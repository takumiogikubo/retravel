class TravelDetail < ApplicationRecord

  belongs_to :travel

  validates :travel_date, presence: true
  validates :travel_title_detail, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validate :start_finish_time_check
  validate :travel_date_check

  def start_finish_time_check
    errors.add(:finish_time,"は開始時間よりも後の時間を選択してください。") unless
    unless finish_time == nil
      start_time <= finish_time
    end
  end

  def travel_date_check
    errors.add(:travel_date,"は旅行期間内で選択してください") unless
    unless travel_date == nil
      travel.travel_start <= travel_date and travel_date <= travel.travel_finish
    end
  end


end
