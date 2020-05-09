# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Check associations' do
    it { should have_many(:posts) }
  end

  context 'Check validation' do
    it { should validate_presence_of :name }
  end
end