class ContactsController < ApplicationController
    before_action :authenticate_user!
def show
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    @contact.save
    redirect_to root_path
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to root_path
  end

  private
  
    def contact_params
        params.require(:contact).permit(:contact_title, :contact_message,:user_id)
    end
end
