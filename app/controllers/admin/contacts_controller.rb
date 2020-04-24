class Admin::ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  	  redirect_to admin_contact_thanks_path
    else
      render 'new'
    end
  end

  def thanks
  end

  def edit
  	@contact = Contact.find(params[:id])
  end

  def update
  	contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
   	contact.update(contact_params)
   	ContactMailer.send_when_admin_reply(contact, contact.admin_text).deliver
  end


  private
  def contact_params
  	params.require(:contact).permit(:name, :email, :user_text, :admin_text)
  end

end
