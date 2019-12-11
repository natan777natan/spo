class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :spotify_login
    before_action :correct_user, only: [:show, :create, :edit, :update]
    def destroy
    end
    def spotify_login
        gon.client_id = ENV['SPOTIFY_CLIENT_ID'];
        gon.redirect_uri = ENV["SPOTIFY_REDIRECT_URI"];
    end
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
        @newuser = User.new
    end
    def edit
        @user = User.find(params[:id])
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

    def correct_user
        user = User.find(params[:id])
        if current_user != user
            redirect_to user_path(current_user.id)
        end
    end

end

