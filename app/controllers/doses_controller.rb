class DosesController < ApplicationController
  def create
    params[:dose][:cocktail_id] = params[:cocktail_id]
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      @error_message = "There was a problem adding your ingredient. Please try again."
      @doses = Dose.all
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end
end
