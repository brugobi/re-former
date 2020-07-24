class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_param)

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    def edit
        @user = User.find(paramas[:id])
    end
    
    private
    def user_param
        params.require(:user).permit(:username,:email,:password)
    end
end
