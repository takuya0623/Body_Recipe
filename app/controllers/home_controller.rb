class HomeController < ApplicationController
  def top
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(4).pluck(:post_id))
  end
end
