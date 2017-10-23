class Course < ApplicationRecord
  has_many :course_subjects, dependent: :destroy
  has_many :having, through: :course_subjects, source: :subject
  has_many :subjects, through: :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :having_user, through: :user_courses, source: :user
  default_scope ->{order(created_at: :desc)}

  scope :not_status_init, ->{where.not status: "init"}
  enum status: [:init, :in_progress, :finish]

  def have subject, date_start
    course_subjects.create subject_id: subject.id, date_start: date_start
  end

  def unhave subject
    having.delete subject
  end

  def have_user user
    having_user << user
  end

  def unhave_user user
    having_user.delete user
  end
end
