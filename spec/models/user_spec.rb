# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Check enum' do
    it { should define_enum_for(:role) }
  end

  context 'Check associations' do
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
  end
end