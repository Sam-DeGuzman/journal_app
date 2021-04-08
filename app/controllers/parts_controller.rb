class PartsController < ApplicationController
  def edit
      @current_user = current_user
  end

  def update
      @user = current_user
      @user.update(firstname: params[:firstname],lastname: params[:lastname],picture: params[:picture])

      if @user.save
        redirect_to root_path, notice: "Profile Settings Changes Saved Successfully!"
      else
        redirect_to edit_profile_path, alert: "Error saving changes, one or more missing fields"
       
      end
  end

end
