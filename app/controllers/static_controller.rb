class StaticController < ApplicationController
  
  #GET /home
  def home
    @posts = Post.all
    create_excerpts(50)
  end

  private
  def create_excerpts(words)
    for post in @posts
      post.excerpt = post.body.split[0...words].join(' ') + '...'
    end
  end
end
