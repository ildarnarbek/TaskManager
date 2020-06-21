class User < ApplicationRecord
  has_secure_password
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id
  validates :last_name, presence: true
  validates :email, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, format: { with: /@/ }, uniqueness: true

  def generate_token
    update(password_reset_token: SecureRandom.urlsafe_base64,
           password_reset_sent_at: Time.current)
  end

  def change_time_reset_token(user)
    update(password_reset_sent_at: user.password_reset_sent_at - 1.days - 1.hours)
  end
end
