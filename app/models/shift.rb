class Shift < ActiveRecord::Base
  belongs_to :employee

  validates :start_time, presence: true
  validates :end_time, presence: true
end
