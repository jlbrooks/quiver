class StaticController < ApplicationController
  
  #GET /home
  def home
    @posts = Post.all
  end
end
