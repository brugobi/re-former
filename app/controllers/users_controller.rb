class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_param)

        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_param)

        flash.notice = "User '#{@user.username}' Updated!"
  
        redirect_to users_path
    end 
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end 

    private
    def user_param
        params.require(:user).permit(:username,:email,:password)
    end
end
