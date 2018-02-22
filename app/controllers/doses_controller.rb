class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def edit
  end

  def destroy
    cocktail = Cocktail.find(params[:cocktail_id])
    dose = Dose.find(params[:id])
    dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktail_path(cocktail), notice: 'Dose was successfully removed from your cocktail!' }
      format.json { head :no_content }
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
