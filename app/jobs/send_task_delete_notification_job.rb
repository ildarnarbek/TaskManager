class SendTaskDeleteNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer
  sidekiq_options lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }

  def perform(task_id,task_author)
    user = User.find(task_author)
    UserMailer.with(user: user, task: task_id).task_deleted.deliver_now
  end
end
