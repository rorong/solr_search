# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  before(:each) do
    assign(:posts, [
             Post.create!
           ])
  end

  it 'renders a list of posts' do
    render
  end
end
