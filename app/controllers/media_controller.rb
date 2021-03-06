class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /media
  # GET /media.json
  def index
    @media = Medium.order('created_at').page params[:page]
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @states_for_select = [['Estado','-1'],['Dropped',1],['Watching',2],['Completed',3]]
    if current_user.present? and not current_user.entries.where(medium: params[:id]).first.nil?
      @state = current_user.entries.where(medium: params[:id]).first
      @state = @state.state
    else
      @state = -1
    end
  end

  # GET /media/new
  def new
    @medium = Medium.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(medium_params)

    respond_to do |format|
      if @medium.save
	if params[:images]
          params[:images].each { |img| @medium.image = Image.new(image: img) }
        end
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
        format.json { render :show, status: :created, location: @medium }
      else
        format.html { render :new }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1
  # PATCH/PUT /media/1.json
  def update
    respond_to do |format|
      if @medium.update(medium_params)
        if params[:images]
          params[:images].each { |img| @medium.image = Image.new(image: img) }
        end
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { render :show, status: :ok, location: @medium }
      else
        format.html { render :edit }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @media = Medium.where("title ILIKE ?","%#{params[:q]}%").page params[:page]
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:imdb, :title, :rated, :released, :runtime, :synopsis, :airing, :airing_time, :serie, :episodes)
    end
end
