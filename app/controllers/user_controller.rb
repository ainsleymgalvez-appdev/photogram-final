class UserController < ApplicationController

  skip_before_action(:force_user_sign_in, { :only => [:home]})

  def home

    matching_users = User.all

     @list_of_users = matching_users.order({ :username => :asc})

      render({:template => "users/homepage.html.erb"})
  end

  def show
    user = params.fetch("path_id")

    @the_user = User.where({ :username => user }).at(0)

    @follower_count = FollowRequest.where(:recipient_id => @the_user.id )

    if @the_user.private == false

    render({:template => "users/show.html.erb"})

    else
      redirect_to("/", { :alert => "You're not authorized for that." })
    end 

  end

  def feed

    render({:template => "users/feed.html.erb"})
  end

  def liked_photos

    render({:template => "users/liked_photos.html.erb"})
  end

  def discover

    render({:template => "users/discover.html.erb"})
  end

end
