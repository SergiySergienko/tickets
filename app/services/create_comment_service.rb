#
# Comment creation service
# expecting repository
# as parameters
#
class CreateCommentService

  attr_reader :current_repository, :enquiry_repository
  #
  # Constructor
  #
  # @param repository
  #
  def initialize(repository, enquiry_repository)
    @current_repository = repository
    @enquiry_repository = enquiry_repository
  end


  def process(entity_attrs)
    enquiry = enquiry_repository.find_by(id: entity_attrs[:enquiry_id].to_i)
    comment = current_repository.prepare_new(entity_attrs)
    return comment unless comment.valid?
    comment = current_repository.create(comment)
    CommentMailer.new_comment(comment, enquiry).deliver
    comment
  end  
  
end