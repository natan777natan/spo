class UsersController < ApplicationController
    before_action :authenticate_user!
    # before_action :correct_user, only: [:show, :edit, :update, :create]
    before_action :spotify_login
    def destroy
        # user = User.find(params[:id])
        # user.destroy
        # redirect_to new_user_session_path
    end
    def spotify_login
        gon.client_id = ENV['SPOTIFY_CLIENT_ID']; #client id
        gon.redirect_uri = ENV["SPOTIFY_REDIRECT_URI"]; #secret
        # @redirect_uri = "http://localhost:3000/map/"; #redirect uri
        @scope = "user-read-private user-read-email"
        @client_id = ENV['SPOTIFY_CLIENT_ID']; 
        @redirect_uri = ENV["SPOTIFY_REDIRECT_URI"];
    end
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @newuser = User.new
        # @user = User.find(params[:spotify_login])
    end
    def edit
        @user = User.find(params[:id])
        # @user = User.find(params[:spotify_login])
    end
    def create
        @newuser = User.new(user_params)
        @newuser.user_id = current_user.id
        if @mewuser.save
            flash[:artist_genre] = "登録完了しました"
            redirect_to user_path(@user.id)
        end
        
    end

    def update
    @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:artist_genre] = "登録完了しました"
            redirect_to user_path(@user.id)
        else
            redirect_to user_path(@user.id)
        end
    end

    def follows
        user = User.find(params[:id])
        @users = user.followings
    end

    def followers
        user = User.find(params[:id])
        @users = user.followers
    end

    private 
    def user_params
        params.require(:user).permit(:name, :profile_image, :genre, :artist)
    end
    # def correct_user
    # user = User.find(params[:id])
    # if current_user != user
    # redirect_to user_path(current_user.id)
    # end
# end
end

