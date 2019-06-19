# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    context 'with a search term' do
      it 'performs a search for matching post text' do
        get :index, params: { search: 'other' }
        expect(Sunspot.session).to be_a_search_for(Post)
        expect(Sunspot.session).to have_search_params(:fulltext, 'other')
      end
    end
    context 'with no search term' do
      it 'should list all posts when no text for search' do
        get :index, params: {}
        expect(response).to be_successful
      end
    end
  end
end
