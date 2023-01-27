class UsersController < ApplicationController
  def index
    @users = User.all.order('posts_counter ASC')
  end

  def show; end
end
