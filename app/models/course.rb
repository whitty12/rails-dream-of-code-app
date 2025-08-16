class Course < ApplicationRecord
  belongs_to :coding_class
  belongs_to :trimester
  has_many :enrollments

  def student_name_list
    names_list = []
    self.enrollments.each do |enrollment|
      names_list << "#{enrollment.student.first_name} #{enrollment.student.last_name}"
    end

    names_list   
  end

  def student_email_list
    student_email_list = []

    #Because we're still checking students enrolled, we do the same as in student name list, but check for email instead
    self.enrollments.each do |enrollment|
        student_email_list << "#{enrollment.student.email}"
    end

    #return the list of emails
    student_email_list
  end

  delegate :title, to: :coding_class
end
