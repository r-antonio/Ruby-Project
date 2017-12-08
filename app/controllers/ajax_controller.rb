class AjaxController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry_from_media, only: [:change_entry_state]
  before_action :set_entry, only: [:add_chapter, :edit_entry]

  def change_entry_state
    @entry.state = params[:state_id]
    if @entry.save
      render json: {code:0,message:'Entry updated'}
    else
      render json: {code:-1,message:'Something went wrong'}
    end
  end

  def add_chapter
    @entry.caps += 1
    if @entry.save
      if @entry.state == 3
        code = 4
      else
        code = 2
      end
      render json: {code:code,caps: @entry.caps,message:"Entry updated"}
    else
      render json: {code:-1,message:"Something went wrong"}
    end
  end

  def edit_entry
    @entry.state = params[:state]
    @entry.rating = params[:rating]
    if @entry.save
      render json: {code:0,rating: @entry.rating,state:@entry.state,message:"Entry updated"}
    else
      render json: {code:-1,message:"Hubo un error"}
    end
  end

  private
    def set_entry_from_media
      unless @entry = current_user.entries.where(medium: params[:media_id]).first
        @entry = current_user.entries.new(medium_id: params[:media_id], caps: 0)
      end
    end
   
    def set_entry
      @entry = Entry.find(params[:entry_id])
    end
end
