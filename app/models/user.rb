class User < ApplicationRecord
  has_secure_password
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id
  validates :last_name, presence: true
  validates :email, presence: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, format: { with: /@/ }, uniqueness: true
  validates :password_reset_token, uniqueness: { allow_blank: true, allow_nil: true }

  def generate_token
    update(password_reset_token: SecureRandom.urlsafe_base64,
           password_reset_sent_at: Time.current)
  end

  def delete_password_reset_token
    update(password_reset_token: nil,
           password_reset_sent_at: nil)
  end

  def has_active_token?(user)
    user.password_reset_sent_at + 24.hour > Time.current
  end
end
