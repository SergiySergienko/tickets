class EnquiriesController < ApplicationController
  before_action :set_manager

  # GET /enquiries
  def index
    @enquiries = @manager.all
  end

  # GET /enquiries/1
  def show
    @enquiry = @manager.find_by(ref_id: params[:id])
    @comments = Repository::AR::Comment.all_by_enquiry_id(@enquiry.id.to_s)
  end

  # GET /enquiries/new
  def new
    @enquiry = @manager.prepare_new
  end

  # POST /enquiries
  def create
    @enquiry = CreateEnquiryService.new(RefIdService, @manager).process(enquiry_params)
    unless @enquiry.errors.empty?
      render :new 
    else 
      redirect_to enquiries_path, notice: 'Enquiry was successfully created.'
    end
  end

  private

  def set_manager
    @manager = Repository::AR::Enquiry
  end

  def enquiry_params
    params.require(:enquiry).permit(:name, :subject, :email, :message, :department)
  end
end
