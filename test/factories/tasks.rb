FactoryBot.define do
  factory :task do
    name
    description
    # author_id { 1 }
    # assignee_id { 1 }
    state
    expired_at
    # association :manager
    # association :manager
    # factory :manager do
    # end
    association :author, factory: :manager
    association :assignee, factory: :manager
  end
end
