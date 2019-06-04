class PostsController < ApplicationController
  def index
    if params[:q].nil?
      @posts = Post.all
    else
      search = Post.search do
        fulltext params[:q]
      end
      @posts = search.results
    end
  end
end
