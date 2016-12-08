class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params) #{name: 'asdf', email: 'asdf', comments: 'asdf'}
    if @contact.save
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ") # [danger0, danger1, danger2, etc]
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end