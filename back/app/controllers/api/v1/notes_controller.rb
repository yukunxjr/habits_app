class Api::V1::NotesController < ApplicationController
    before_action :set_note, only: %i[show destroy update]

    def index
        # notes = note.all.order(:id)
        @notes = Note.all
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
    
    private

    def set_note
      @note = Note.find(params[:id])
    end
  
    def note_params
      params.require(:note).permit(:body, :title)
    end
end

