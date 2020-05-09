# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Check enum' do
    it { should define_enum_for(:status) }
  end

  context 'Check associations' do
    it { should have_many(:taggings).dependent(:destroy) }
    it { should have_many(:tags).through(:taggings) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }

    it { should belong_to(:category) }
    it { should belong_to(:user) }
  end

  context 'Check validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :body }
  end
end