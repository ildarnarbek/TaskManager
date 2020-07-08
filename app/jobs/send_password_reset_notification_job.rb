class SendPasswordResetNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  sidekiq_options lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }

  def perform(email)
    @user = User.find(email: email)
    UserMailer.with({ user: @user }).password_reset.deliver_now
  end
end
