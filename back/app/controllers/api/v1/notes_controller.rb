class Api::V1::NotesController < ApplicationController
    before_action :set_note, only: %i[show destroy update]

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
      @del = note.discarded.where(user_id: current_user)
      render json: @del
    end

    def discard
      if @note.discard
        render json: @note
      else
        render json: @note.errors
      end
    end

    end

    def restoration
      if @note.undiscard(note_params)
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
end

