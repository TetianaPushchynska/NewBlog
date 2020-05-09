# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'MyTitle' }
    summary { 'MySummary' }
    body { 'MyBody' }
    status { 1 }
    user_id { create(:user).id }
    category_id { create(:category).id }
  end
end