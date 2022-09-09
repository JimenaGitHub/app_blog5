class ArticulosController < ApplicationController
  before_action :set_articulo, only: %i[ show edit update destroy ]

  # GET /articulos or /articulos.json
  def index
    #@articulos = Articulo.all
    @articulos = Articulo.order(:titulo).page params[:page]
  end

  # GET /articulos/1 or /articulos/1.json
  def show
  end

  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  def list
    @articulos = Articulo.buscar(params[:buscar]).page(params[:page])

  end

  # POST /articulos or /articulos.json
  def create
    @articulo = Articulo.new(articulo_params)

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to articulo_url(@articulo), notice: "Articulo was successfully created." }
        format.json { render :show, status: :created, location: @articulo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1 or /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to articulo_url(@articulo), notice: "Articulo was successfully updated." }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_articulo
    @articulo = Articulo.find(params[:id])
  end

  # DELETE /articulos/1 or /articulos/1.json
  def destroy
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to articulos_url, notice: "Articulo was successfully destroyed." }
      format.json { head :no_content }
    end

   

  private
    # Use callbacks to share common setup or constraints between actions.
   

    # Only allow a list of trusted parameters through.
    def articulo_params
      params.require(:articulo).permit(:titulo, :contenido, :fecha_publicacion)
    end
  end


end
