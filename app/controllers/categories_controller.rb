class CategoriesController < ApplicationController  
  def index
    @user_categories = Category.where(user_id: current_user).paginate(page: params[:page],per_page:5)
   
  end

  def create
    @category = Category.new    
    @category.user_id = params[:user_id]
    @category.description = params[:description]
    @category.category_name = params[:category_name]
    

    if @category.save
      # redirect to index.html.erb on successful save
      flash.now[:notice] = 'Category Successfully created'
      redirect_to categories_path
    else
      flash.now[:alert] = 'Error Adding Category, Has Duplicate'
      render :new

    end
  end

  def new
  end

  def edit
    @category = Category.find_by_id(params[:id])
  end

  def destroy
    @del_category = Category.find_by_hashid(params[:id])
    if @del_category.present?
      @del_category.destroy
    end
    redirect_to categories_path
  end

  def update
    @update_category = Category.find_by_id(params[:id])
    @update_category.update(category_name: params[:category_name], description: params[:description])

    if @update_category.save
      redirect_to categories_path, notice: 'Changes saved Successful'
      
    else
      redirect_to categories_path, alert: 'Error saving changes, one or more field/s missing'
    end
  end
end
