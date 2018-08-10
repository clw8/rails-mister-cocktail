class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
    @dose = Dose.new
    @ingredients = Ingredient.all

  end

  def new
    @cocktail = Cocktail.new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    new_prm = params_new_cocktail
    @cocktail = Cocktail.new(
      name: new_prm[:name],
      image: new_prm[:image],
      description: new_prm[:description]
    )
    if @cocktail.valid?
      dose_description_arr = new_prm[:dose_description].split('$%')
      @cocktail.save
      new_prm[:dose_ingredient_id].split(',').each_with_index do |id, index|
        @dose = Dose.new(
          cocktail_id: @cocktail.id,
          ingredient_id: id,
          description: dose_description_arr[index]
        )
        if @dose.valid?
          @dose.save
        end
      end
      redirect_to cocktail_path(@cocktail)
    else
      @ingredients = Ingredient.all
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(params_update_cocktail)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_update_cocktail
    params.require(:cocktail).permit(:name, :description, :image)
  end

  def params_new_cocktail
    params[:cocktail][:dose_ingredient_id] = params[:dose_ingredient_id]
    params[:cocktail][:dose_description] = params[:dose_description]
    params.require(:cocktail).permit(:name, :description, :image, :dose_ingredient_id, :dose_description)
  end
end
