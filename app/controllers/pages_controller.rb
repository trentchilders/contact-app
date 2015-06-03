class PagesController < ApplicationController
  def home
    @first_contact = Contact.first
  end

  def index
    @all_contacts = Contact.all
  end

  def new
  end

  def create
    Contact.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number])
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
  end

  def edit
    @contact_id = params[:id]
    @contact = Contact.find_by(id: @contact_id)
  end

  def update
    @contact_id = params[:id]
    @contact = Contact.find_by(id: @contact_id)
    @contact.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number])
  end

  def destroy
    @contact_id = params[:id]
    @contact = Contact.find_by(id: @contact_id)
    @contact.destroy
  end
end
