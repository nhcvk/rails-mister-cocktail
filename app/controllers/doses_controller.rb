class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.save
    # redirect_to cocktail_path(@dose.ingredient)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :amount, :cocktail_id, :ingredient_id)
  end

end

#  def create
#     @cocktail = Cocktail.find(params[:cocktail_id])
#     @dose = Dose.new(dose_params)
#     @dose.cocktail = @cocktail
#     if @dose.save
#       redirect_to cocktail_path(@cocktail)
#     else
#       @review = Review.new
#       render "cocktails/show"
#     end
#   end

#   def destroy
#     @dose = Dose.find(params[:id])
#     @dose.destroy
#     redirect_to cocktail_path(@dose.cocktail)
#   end

#   private

#   def dose_params
#     params.require(:dose).permit(:description, :ingredient_id)
#   end
# end
