class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :student
  has_many :mentor_enrollment_assignments
  
  def student_name
    "#{student.first_name} #{student.last_name}"
  end
end
