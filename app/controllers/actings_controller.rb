class ActingsController < ApplicationController
  before_action :set_acting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /acting
  # GET /acting.json
  def index
    medium = Medium.find(params[:medium_id])
    @acting = medium.actings
  end

  # GET /actings/1
  # GET /actings/1.json
  def show
  end

  # GET /actings/new
  def new
    medium = Medium.find(params[:medium_id])
    @acting = medium.actings.build
  end

  # GET /actings/1/edit
  def edit
  end

  # POST /actings
  # POST /actings.json
  def create
    @acting = Acting.create(acting_params)

    respond_to do |format|
      if @acting.save
        format.html { redirect_to @acting.medium, notice: 'Acting was successfully created.' }
        format.json { render :show, status: :created, location: @acting }
      else
        format.html { render :new }
        format.json { render json: @acting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actings/1
  # PATCH/PUT /actings/1.json
  def update
    respond_to do |format|
      if @acting.update
        format.html { redirect_to @acting.medium, notice: 'Acting was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @acting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actings/1
  # DELETE /actings/1.json
  def destroy
    @acting.destroy
    respond_to do |format|
      format.html { redirect_to @acting.medium, notice: 'Acting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acting
      medium = Medium.find(params[:medium_id])
      @acting = medium.actings.find(params[:id])
    end

    def acting_params
      params.require(:acting).permit(:medium_id, :person_id, :character_id)
    end

end
