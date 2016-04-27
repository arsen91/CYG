require 'pry'
class NotesController < ApplicationController
  def create
    note_params = get_note_params
    note_params['journal_id'] = params[:journal_id]
    note_params['category_id'] = Category.where(name: params[:note][:category_id])[0].id
    @note = Note.create(note_params)

    respond_to do |format|
        format.json { render json: { note: @note, categoryName: params[:note][:category_id]} }
    end
  end

  private
    def get_note_params
        params.require(:note).permit(:description)
    end
end
