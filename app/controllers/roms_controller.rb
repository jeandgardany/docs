class RomsController < ApplicationController
  before_action :set_rom, only: [:show, :edit, :update, :destroy]

  # GET /roms
  # GET /roms.json
  def index
    @roms = Rom.all.where(user_id: current_user.id)
    @compartilhados = Compartilhado.joins(:usuarios).where(usuarios: {user_id: current_user.id})
  end

  # GET /roms/1
  # GET /roms/1.json
  def show
  end

  # GET /roms/new
  def new
    @rom = Rom.new
  end

  # GET /roms/1/edit
  def edit
    @documento = @rom.documentos
  end

  #def delete_anexo_attachment
  #@anexo = ActiveStorage::Blob.find_signed(params[:id])
  #@anexo.purge
  #redirect_to rom_url
  #end

  #def delete_documento_attachment
  #@documento = ActiveStorage::Blob.find(params[:id])
  #@documento.purge
  #redirect_to rom_url
  #end

  # POST /roms
  # POST /roms.json
  def create
    @rom = Rom.new(rom_params)

    respond_to do |format|
      if @rom.save
        format.html { redirect_to @rom, notice: 'Rom was successfully created.' }
        format.json { render :show, status: :created, location: @rom }
      else
        format.html { render :new }
        format.json { render json: @rom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roms/1
  # PATCH/PUT /roms/1.json
  def update
    respond_to do |format|
      if @rom.update(rom_params)
        format.html { redirect_to @rom, notice: 'Rom was successfully updated.' }
        format.json { render :show, status: :ok, location: @rom }
      else
        format.html { render :edit }
        format.json { render json: @rom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roms/1
  # DELETE /roms/1.json
  def destroy
    @rom.destroy
    respond_to do |format|
      format.html { redirect_to roms_url, notice: 'Rom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rom
      @rom = Rom.find(params[:id])
      @documentos = @rom.documentos
      @compartilhados = @rom.compartilhados
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rom_params
      params.require(:rom).permit(:nome, :user_id, documentos:[], anexos:[])
    end
end
