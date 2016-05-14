class SearchController < ApplicationController
  def index
    @keyword = params[:keyword]
    @posts = Post.where("title like ?", "%#{ params[:keyword] }%")
  end
end
