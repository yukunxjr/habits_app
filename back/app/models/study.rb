class Study < ApplicationRecord
    belongs_to :skill
    belongs_to :user

    validates :date, presence: true
    validates :skill_id, presence: true
    validates :user_id, presence: true
    validates :time, presence: true
    validate :total_time_cannot_exceed_limit_time, on: :create

    LIMIT_TIME_HOUR = 24

    def day_time_sum(date)
        Study.where(date: date,user_id: user.id).sum(:time)
    end

    def total_time_cannot_exceed_limit_time
        if day_time_sum(date) + time > LIMIT_TIME_HOUR
        errors.add(:date, ":#{date.strftime("%Y年%m月%d日")}の学習時間の合計が#{LIMIT_TIME_HOUR}時間を超えています")
        end
    end
end
