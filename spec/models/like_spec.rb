# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Check associations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  context 'Check validation' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :post_id }
  end
end