class CitaController < ApplicationController
  def index
    @cita = Citum.all
  end

  def new
    @citum = current_user.cita.build
  end

  def show
  end

  def edit
  end

  def create
    @citum = current_user.cita.build(citum_params)

    respond_to do |format|
      if @citum.save
        format.html { redirect_to @citum, notice: 'La cita fue creada exitosamente' }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end
end
