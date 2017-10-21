class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /roles
  # GET /roles.json
  def index
    medium = Medium.find(params[:medium_id])
    @role = medium.roles
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    medium = Medium.find(params[:medium_id])
    @role = medium.roles.build
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.create(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role.medium, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role.medium, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to actings_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      medium = Medium.find(params[:medium_id])
      @role = medium.roles.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:role, :medium_id, :person_id)
    end
end
