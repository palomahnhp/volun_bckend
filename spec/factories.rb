FactoryGirl.define do
  factory :notice_type do
    kind 1
    description "MyText"
    active true
  end

  factory :user do
    login  'My login'
    locale 'en'
    email  'user@email.com'
    password 'Wordpass1'
    password_confirmation 'Wordpass1'
    association :notice_type
    loggable_id nil
    loggable_type nil
  end
end
