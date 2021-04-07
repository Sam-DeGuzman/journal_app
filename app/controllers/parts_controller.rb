class PartsController < ApplicationController
  def edit
      @current_user = current_user
  end

  def update
      @user = current_user
      @user.update(firstname: params[:firstname],lastname: params[:lastname],picture: params[:picture])

      if @user.save
        flash.now[:notice] = 'Changes saved Successfully'
        redirect_to root_path
      else
        flash.now[:alert] = 'Error saving changes, one or more missing fields'
        redirect_to edit_profile_path
      end
  end

end
