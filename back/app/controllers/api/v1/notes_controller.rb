class Api::V1::NotesController < ApplicationController
   before_action :authenticate_user!
    before_action :set_note, only: %i[show destroy update discard restoration]

    def index
        @notes =  Note.undiscarded.where(user_id: current_user)
        render json: @notes
    end

    def show
        render json: @note
    end

    def create
        note = Note.new(note_params)
        if note.save
            render json: note
        else
            render json: note.errors
        end
    end

    def update
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors
      end
    end
    
    def destroy
      if @note.destroy
        render json: @note
      else
        render json: @note.errors
      end
    end

    def trashcan
      @notes =  Note.discarded.where(user_id: current_user)
      render json: @notes
    end

    def discard
      if @note.discard
        render json: @note
      else
        render json: @note.errors
      end
    end

    def restoration
      @note = Note.find(params[:id])
      if @note.undiscard
        render json: @note
      else
        render json: @note.errors
      end
    end
    
    private

    def set_note
      @note = Note.find(params[:id])
    end
  
    def note_params
      params.require(:note).permit(:body, :title).merge(user_id: current_user.id)
    end

    # def restoration_params
    #   params.permit(:body, :title, :id)
    # end
end

