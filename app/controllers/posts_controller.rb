# frozen_string_literal: true

# Post class for search post record
class PostsController < ApplicationController
  def index
    search_text = params[:q]
    if search_text.blank?
      @posts = Post.all
    else
      search = Post.search do
        fulltext search_text
      end
      @posts = search.results
    end
  end
end
