class PathologiesController < ApplicationController
  before_action :set_pathology, only: [:show, :edit, :update, :destroy]

  def index
    @pathologies = Pathology.all
  end

  def show
  end

  def new
    @pathology = Pathology.new
  end


  def edit
  end

  def create
    @pathology = Pathology.new(pathology_params)

    respond_to do |format|
      if @pathology.save
        format.html { redirect_to @pathology, notice: 'Pathology was successfully created.' }
        format.json { render :show, status: :created, location: @pathology }
      else
        format.html { render :new }
        format.json { render json: @pathology.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @pathology.update(pathology_params)
        format.html { redirect_to @pathology, notice: 'Pathology was successfully updated.' }
        format.json { render :show, status: :ok, location: @pathology }
      else
        format.html { render :edit }
        format.json { render json: @pathology.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pathology.destroy
    respond_to do |format|
      format.html { redirect_to pathologies_url, notice: 'Pathology was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pathology
      @pathology = Pathology.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pathology_params
      params.require(:pathology).permit(:idpathology, :cie10_code, :pathology_name, :description)
    end
end
