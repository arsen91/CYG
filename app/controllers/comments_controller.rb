require 'pry'
class CommentsController < ApplicationController
    def create
        @comment = Comment.create(comment_params);
        @comment.user_id = current_user.id
        @comment.save
               
        respond_to do |format| 
            format.json {
                render json: {
                    comment: @comment, 
                    user_name: current_user.full_name, 
                    user_score: @comment.get_user.get_rating(@comment.garage_id).first.score
                } 
            }
        end
    end

    def destroy
        comment = Comment.find(params[:commentObj])
        comment.destroy

        respond_to do |format|
            format.json { render json: { status: "OK" } }
        end
    end

    private 
        def comment_params
            params.require(:comment).permit(:content, :user_id, :garage_id)
        end
end
