class RecetaController < ApplicationController
  
  before_action :set_recetum, only: [:preview, :show, :edit, :update]

  def preview
  end

  def edit
  end

  def update
  end

  def show
  end

  def set_recetum
      @recetum = Recetum.find(params[:id])
    end

end
