module Admin
  class UsersController < AdminController
    include UsersHelper

    def show
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.admin_updating_user = true
      save = true
      if params[:password]
        if secure_password?(params[:password])
          @user.password = params[:password]
        else
          redirect_to({:action => "show", :id => @user.id}, {:notice => "Password does not meet our security requirements. Please use a password at least 8 characters long, including a number and a special character ($@%^!*). Help keep Trans Lifeline safe!"})
          save = false
        end
      end

      if save
        if @user.save
          redirect_to edit_user_path(@user.id), :notice => "User has been updated"
        else
          redirect_to({:action => "show", :id => @user.id}, {:notice => "User could not be saved"})
        end
      end
    end
  end
end
