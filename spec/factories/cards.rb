FactoryBot.define do
  factory :card do
    deck { nil }
    front_text { "MyText" }
    back_text { "MyText" }
    last_done_at { "2023-08-19" }
    done_count { 1 }
  end
end
