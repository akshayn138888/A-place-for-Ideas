class UsersController < ApplicationController
     def new
        if user_signed_in?
          flash[:warning] = "Can't create new account while signed in"
          redirect_to ideas_path
        else 
          @user = User.new
        end
     end
    
      def create
        @user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
        if @user.save
          flash.delete(:warning)
          redirect_to new_session_path
        else
          flash[:warning] = "Unable to create user"
          render :new
        end
      end
end
