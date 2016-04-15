require 'pry'
class NotesController < ApplicationController
  def create
    note_params = get_note_params
    note_params['journal_id'] = params[:journal_id]
    @note = Note.create(note_params)
  end

  private
    def get_note_params
        params.require(:note).permit(:description)
    end
end
