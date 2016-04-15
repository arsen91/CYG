require 'pry'
class JournalsController < ApplicationController
    def index
        @journal = Journal.where(user_id: current_user.id)
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
            # binding.pry
            if @journal.any?
                Note.where(journal_id: @journal[0].id)
            end
        end
end
