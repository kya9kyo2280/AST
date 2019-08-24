class Admin::ContactCommentsController < ApplicationController
before_action :authenticate_admin!
  def create
    @contact = Contact.find(params[:contact_id])
    @contact_comment = @contact.contact_comments.new(contact_comment_params)
    if @contact_comment.save
      redirect_to admin_contacts_path
    else
      redirect_to admin_studies_path
    end

  end

  private
  def contact_comment_params
    params.require(:contact_comment).permit(:reply, :contact_id)
  end
end
