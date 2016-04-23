class JournalsController < ApplicationController
    def show
        @journal = Journal.find(params[:id])
        @note = Note.new
        @notes = get_notes
    end

    def create
        @journal = Journal.create(user_id: current_user.id)
        respond_to do |format|
            format.json { render json: {journal: @journal, notes: get_notes} }
        end
    end

    private
        def get_notes
            if @journal
                Note.where(journal_id: @journal.id)
            end
        end
end
