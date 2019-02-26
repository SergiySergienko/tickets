class EnquiriesController < ApplicationController
  before_action :set_manager

  # GET /enquiries
  # GET /enquiries.json
  def index
    # @enquiries = @manager.all
    @enquiries = @manager.all
  end

  # GET /enquiries/1
  # GET /enquiries/1.json
  def show
    @enquiry = @manager.find_by(ref_id: params[:id])
    @comment = Storages::Memory::Repositories::Comment.prepare_new(enquiry: enquiry)
  end

  # GET /enquiries/new
  def new
    @enquiry = @manager.prepare_new
  end

  # POST /enquiries
  def create
    @enquiry = @manager.create(enquiry_params)
    unless @enquiry.errors.empty?
      render :new 
    else 
      redirect_to enquiries_path, notice: 'Enquiry was successfully created.'
    end
  end

  private

  def set_manager
    @manager = Storages::Memory::Repositories::Enquiry
  end

  def enquiry_params
    params.require(:enquiry).permit(:name, :subject, :email, :message, :department)
  end
end
