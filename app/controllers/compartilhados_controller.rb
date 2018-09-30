class CompartilhadosController < ApplicationController
  before_action :set_compartilhado, only: [:show, :edit, :update, :destroy]

  # GET /compartilhados
  # GET /compartilhados.json
  def index
    @compartilhados = Compartilhado.all
    @roms = Rom.order(nome: :asc)
    #@usuarios = @compartilhado.usuarios.build
    @usuarios = @compartilhado.usuarios
  end

  # GET /compartilhados/1
  # GET /compartilhados/1.json
  def show
    @users = User.all
    @user = @compartilhado.users.build
    @usuarios = @compartilhado.usuarios.build
    @compartilhados = Compartilhado.all.where(id: current_user.id)
    #@usuarios = Usuario.all
  end

  # GET /compartilhados/new
  def new
    @compartilhado = Compartilhado.new
    #@user = @compartilhado.users.build
    @user = @compartilhado.users.build
  end

  # GET /compartilhados/1/edit
  def edit
  end

  def delete_arquivo_attachment
  @arquivo = ActiveStorage::Blob.find_signed(params[:id])
  @arquivo.purge
  redirect_to root_path
  end

  # POST /compartilhados
  # POST /compartilhados.json
  def create
    @compartilhado = Compartilhado.new(compartilhado_params)

    respond_to do |format|
      if @compartilhado.save
        format.html { redirect_to @compartilhado, notice: 'Compartilhado was successfully created.' }
        format.json { render :show, status: :created, location: @compartilhado }
      else
        format.html { render :new }
        format.json { render json: @compartilhado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compartilhados/1
  # PATCH/PUT /compartilhados/1.json
  def update
    respond_to do |format|
      if @compartilhado.update(compartilhado_params)
        format.html { redirect_to @compartilhado, notice: 'Compartilhado was successfully updated.' }
        format.json { render :show, status: :ok, location: @compartilhado }
      else
        format.html { render :edit }
        format.json { render json: @compartilhado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compartilhados/1
  # DELETE /compartilhados/1.json
  def destroy
    @compartilhado.destroy
    respond_to do |format|
      format.html { redirect_to compartilhados_url, notice: 'Compartilhado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compartilhado
      @compartilhado = Compartilhado.find(params[:id])
      @usuarios = @compartilhado.usuarios
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compartilhado_params
      params.require(:compartilhado).permit(:nome, :user_id, arquivos:[], usuarios_attributes: [:id, :user_id, users_attributes: [:id, :email, :nome, :age, :password, :password_confirmation, :current_password]])
    end
end
