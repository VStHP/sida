class CourseSubject < ApplicationRecord
  belongs_to :courses
  belongs_to :subjects

  validates :course_id, presence: true
  validates :subject_id, presence: true

  enum status: [:init, :in_progress, :finish]

  def have user_ids
    user_subjects.create user_id: user_ids, status: "in_progress"
  end
end
