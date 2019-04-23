class NotesController < ApplicationController
    before_action :require_user!
    before_action :require_note_ownership!, only: %i(destroy)

    def index
        @notes = Note.all
    end

    def show
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new
    end

    def create
        @note = current_user.notes.new(note_params)
        if @note.save!
            redirect_to note_path(@note)
        else
            flash.now[:errors] = @note.errors.full_messages
            render :new
        end
    end
    
    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        if @note.update_attributes(note_params)
            redirect_to note_url(@note)
        else
            flash.now[:errors] = @note.errors.full_messages
            render :edit
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        redirect_to notes_path
    end

    private
    def current_note
        @note ||=
        Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:track_id, :note_text)
    end

    def require_note_ownership!
        return if current_user.owns_note?(current_note)
        redirect_to note_url(current_note)
    end
end
