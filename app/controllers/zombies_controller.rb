class ZombiesController < ApplicationController
  before_action :set_zombie, only: [:show, :edit, :update, :destroy]

  # GET /zombies
  # GET /zombies.json
  def index
    #Variable de bloque
    if current_admin  #Usuario
      role = current_admin.role
      if role == "Contribuidor"
        @zombies = Zombie.where('admin_id = ?', current_admin.id)  
      elsif role == "Suscriptor"
        @zombies = Zombie.where('admin_id = ?', current_admin.id) 
      else  
        @zombies = Zombie.all
      end  
    else 
      #Administradores
       redirect_to("admins_List")
    end  
    
    @rotten_zombies = Zombie.where(rotten:true)
  end

  # GET /zombies/1
  # GET /zombies/1.json
  def show
  end

  # GET /zombies/new
  def new
    @zombie = Zombie.new
  end

  # GET /zombies/1/edit
  def edit
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(zombie_params)
    @zombie.admin_id = current_admin.id
  
  
    respond_to do |format|
      if @zombie.save
        format.html { redirect_to @zombie, notice: 'Zombie fue creado correctamente.' }
        format.json { render :show, status: :created, location: @zombie }
      else
        format.html { render :new }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /zombies/1
  # PATCH/PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update(zombie_params)
        format.html { redirect_to @zombie, notice: 'Zombie Fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @zombie }
      else
        format.html { render :edit }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy
    respond_to do |format|
      format.html { redirect_to zombies_url, notice: 'Zombie fue destruido :(.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zombie
      @zombie = Zombie.find(params[:id])
     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zombie_params
      params.require(:zombie).permit(:name, :bio, :age, :email, :rotten, :avatar)
    end
end
