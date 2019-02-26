class CommentsController < ApplicationController
  before_action :set_manager

  # GET /enquiries/new
  def new
    @enquiry = @manager.prepare_new
  end

  # POST /enquiries
  # POST /enquiries.json
  def create
    @enquiry = @manager.prepare_new(comment_params)

    respond_to do |format|
      if @enquiry.valid? && @manager.create(@enquiry)
        format.html { redirect_to @enquiry, notice: 'Enquiry was successfully created.' }
        format.json { render :show, status: :created, location: @enquiry }
      else
        format.html { render :new }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquiries/1
  # DELETE /enquiries/1.json
  # def destroy
  #   @enquiry.destroy
  #   respond_to do |format|
  #     format.html { redirect_to enquiries_url, notice: 'Enquiry was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def set_manager
      # @manager ||= Entity::Enquiry::Manager.new(Storages::MemoryStorage.instance)
      @manager ||= Entity::Manager.new(Enquiry, Storages::MemoryStorage.instance)
    end

    def comment_params
      params.require(:comment).permit(:name, :subject, :email, :message)
    end
end
