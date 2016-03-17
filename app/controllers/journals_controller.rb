class JournalsController < ApplicationController
    def index
        @journal = Journal.where(user_id: current_user.id)
    end

    def create
        
        @journal = Journal.create(user_id: current_user.id)
        respond_to do |format|
            format.json { render json: {journal: @journal, notes: get_notes} }
        end
    end

    private
        def get_notes
            Notes.where(journal_id: @journal.id)
        end
end
