class Admin::SubCategoriesController < Admin::ApplicationController
  before_action :authenticate_user!
  authorize_resource class: false
  before_action :set_category
  before_action :set_sub_category, only: [:edit, :update, :destroy]
  def new
    @sub_category = @category.sub_categories.new
  end

  def create
    @sub_category = @category.sub_categories.new(sub_category_params)
    if @sub_category.save
      redirect_to admin_category_path(@category.id), notice: 'Sub Category was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to admin_category_path(@category.id), notice: 'Sub Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sub_category.destroy
    redirect_to admin_category_path(@category.id), notice: 'Sub Category was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find_by(id: params[:category_id]) or not_found
    end

    def set_sub_category
      @sub_category = @category.sub_categories.find_by(id: params[:id]) or not_found
    end

    def sub_category_params
      params.require(:sub_category).permit(:name)
    end
end