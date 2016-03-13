require 'pry'
class CommentsController < ApplicationController
    def create
        @comment = Comment.create(comment_params);
        @comment.user_id = current_user.id
        @comment.save
               
        respond_to do |format| 
            format.json {render json: @comment}
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content, :user_id, :garage_id)
        end
end
