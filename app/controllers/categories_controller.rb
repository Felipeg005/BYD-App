class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @icons = ['icon-bill.png', 'icon-hospital.png', 'icon-hotel.png', 'icon-house.png', 'icon-mobile.png', 'icon-party.png',
    'icon-restaurant.png', 'icon-taxi.png', 'icon-vacation.png', 'icon-money.png']
  end

  def create
    if Recipe.new(recipes_params).invalid?
      flash[:notice] = 'The Recipe was not saved for incorrect data'
      redirect_to '/recipes/new/'
    else
      @recipe = Recipe.create!(recipes_params)
      respond_to do |format|
        format.html do
          if @recipe.save
            # success message
            flash[:success] = 'Recipe saved successfully'
            # redirect to index
            redirect_to '/recipes/'
          else
            # error message
            flash.now[:error] = 'Error: Recipe could not be saved'
            # render new
            render :new, locals: { recipe: @recipe }
          end
        end
      end
    end
  end
end
