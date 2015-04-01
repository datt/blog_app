class SearchController < ApplicationController

  def index
  end

  def posts
    search = Post.search do
      fulltext params[:fulltext]
      paginate :page => 1, :per_page => 30
    end
    respond_to do |format|
      format.json { render json: search.as_json }
    end
  end
end
