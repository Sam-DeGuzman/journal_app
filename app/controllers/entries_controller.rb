class EntriesController < ApplicationController  
  def landing
    if user_signed_in?
      render :action => 'logged_in'
     else
      render :action => 'not_logged_in'
     end   
  end
  
  def create
    @entry = Entry.new    
    @entry.category_id = params[:category_id]
    @entry.user_id = params[:user_id]
    @entry.title = params[:title]
    @entry.entry_stat = params[:entry_stat]
    @entry.content = params[:content]
    @entry.deadline = params[:deadline]
    
    if @entry.save
      # redirect to index.html.erb on successful save
      flash.now[:notice] = 'Successfully saved'
      render :new
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
        @entry.update(category_id: params[:category_id],cover_image: params[:cover_image],title:params[:title], entry_stat: params[:entry_stat] ,content: params[:content], deadline: params[:deadline])

        if @entry.save
          # redirect to index.html.erb on successful save
          flash.now[:notice] = 'Changes saved Successfully'
          redirect_to entries_path
        else
    
          flash.now[:alert] = 'Error saving changes, one or more missing fields'
          render :new
    
        end
  end

  
end
