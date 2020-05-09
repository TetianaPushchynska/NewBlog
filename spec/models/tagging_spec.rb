# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tagging, type: :model do
  context 'Check associations' do
    it { should belong_to(:post) }
    it { should belong_to(:tag) }
  end
end