class CommentsController < ApplicationController
  before_action :set_manager

  # POST /comments.json
  def create
    @comment = CreateCommentService.new(@manager, Repository::AR::Enquiry).process(comment_params)
    respond_to do |format|
      if @comment.errors.empty?
        format.json { render :show, status: :created, comment: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_manager
      @manager = Repository::AR::Comment
    end

    def comment_params
      params.require(:comment).permit(:enquiry_id, :message)
    end
end
