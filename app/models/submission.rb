class Submission < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  belongs_to :mentor
end
