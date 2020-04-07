class Admin::CategoriesController < Admin::AdminController
  
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: 'Category created!'
    else
      flash[:danger] = 'Error! Category not created.'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, success: 'Category updated!'
    else
      flash[:danger] = 'Error! Category not updated.'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: 'Category deleted!'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

end