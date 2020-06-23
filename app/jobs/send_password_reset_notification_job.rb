class SendPasswordResetNotificationJob < ApplicationJob
    sidekiq_options queue: :mailers
    sidekiq_throttle_as :mailer
  
    def perform(email)
      @user = User.find_by(email: email)
      return if @user.blank?
  
      UserMailer.with({ user: @user }).password_reset.deliver_now
    end
  end
  