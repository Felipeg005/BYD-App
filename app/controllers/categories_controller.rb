class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @icons = ['icon-bill.png', 'icon-hospital.png', 'icon-hotel.png', 'icon-house.png', 'icon-mobile.png', 'icon-party.png',
      'icon-restaurant.png', 'icon-taxi.png', 'icon-vacation.png', 'icon-money.png']
  end

  def new
    @category = Category.new
    @icons = ['icon-bill.png', 'icon-hospital.png', 'icon-hotel.png', 'icon-house.png', 'icon-mobile.png', 'icon-party.png',
    'icon-restaurant.png', 'icon-taxi.png', 'icon-vacation.png', 'icon-money.png']
  end

  def create
    if Category.new(category_params).invalid?
      flash[:notice] = 'The category was not saved for incorrect data'
      redirect_to '/categories/new/'
    else
      @category = Category.create!(category_params)
      respond_to do |format|
        format.html do
          if @category.save
            # success message
            flash[:success] = 'category saved successfully'
            # redirect to index
            redirect_to '/categories/'
          else
            # error message
            flash.now[:error] = 'Error: category could not be saved'
            # render new
            render :new, locals: { category: @category }
          end
        end
      end
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:name, :author_id, :icon)
  end
end
