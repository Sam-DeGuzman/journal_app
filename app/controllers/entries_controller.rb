class EntriesController < ApplicationController  
  def landing
    if user_signed_in?
      render :action => 'logged_in'
     else
      render :action => 'not_logged_in'
     end   
  end
  
  def create
    @entry = Entry.create(entries_params)
    
    if @entry.save
      # redirect to index.html.erb on successful save
      redirect_to entries_path, notice: 'Successfully saved'
    else
      flash.now[:alert] = 'Missing Required fields!'
      render :new

    end
  end

  def destroy
    @entry = Entry.find_by_hashid(params[:id])
      if @entry.present?
        @entry.destroy
      end
      redirect_to entries_path
  end

  def edit
    @entry = Entry.find_by_hashid(params[:id])
  end

  def index
    @user_categories = Category.where(user_id: current_user)
    @getduetoday = current_user.entries.where(deadline: Date.today.all_day)
    if current_user.focus_assist == true
      flash.now[:notice] = 'Focus Assist is Turned On, Limiting the results to only show entries due today, you can turn it off at the "Account Settings" Section '
        @entries = @getduetoday.paginate(page: params[:page],per_page:5)
    else
      @entries = current_user.entries.paginate(page: params[:page],per_page:5)
    end
    
  end

  def logged_in
  end

  def new
    
  end

  def not_logged_in
  end

  def show
    @entry = Entry.find_by_hashid(params[:id])
  end

  def update
    @entry = Entry.find_by_id(params[:id])
        @entry.update(entries_params)

        if @entry.save
          # redirect to index.html.erb on successful save
          redirect_to entries_path, notice: "Changes Saved Successfully!"
        else
          redirect_to entries_path, alert: "Error changing changes"
        end
  end

  private 

  def entries_params

    params.permit(
     :category_id,:user_id,:cover_image,:title,:entry_stat,:content,:deadline)
    
  end
  
end
