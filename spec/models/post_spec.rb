# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_searchable_field(:name) }
  it { should have_searchable_field(:body) }
end
