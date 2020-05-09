# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  context 'Check associations' do
    it { should have_many(:taggings) }
    it { should have_many(:posts).through(:taggings) }
  end
end