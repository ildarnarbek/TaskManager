# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    sequence(:name) { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}" }
    sequence(:author_id) { |n| n }
    sequence(:assignee_id) { |n| n + 2 }
    sequence(:state) { |n| "state#{n}" }
    sequence(:expired_at) { |n| Time.now + n.days.to_s }
  end
end
