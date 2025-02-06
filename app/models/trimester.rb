class Trimester < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :application_deadline, presence: true
end
