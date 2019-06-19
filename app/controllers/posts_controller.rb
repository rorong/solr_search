# frozen_string_literal: true

# Post class for search post record
class PostsController < ApplicationController
  def index
    search_text = params[:search]
    @posts = if search_text.blank?
               Post.all
             else
               Sunspot.search(Post) do
                 fulltext search_text
               end.results
             end
  end
end
