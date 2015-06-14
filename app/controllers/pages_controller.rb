class PagesController < ApplicationController
  def home
    @first_contact = Contact.first
  end

  def index
    if user_signed_in?
      @all_contacts = current_user.contacts
    else
      redirect_to '/users/sign_in'
    end

    if params[:group]
      @all_contacts = Group.find_by(name: params[:group]).contacts
    end
  end

  def new
  end

  def create
    coordinates = Geocoder.coordinates(params[:address])

    Contact.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio], latitude: coordinates[0], longitude: coordinates[1], user_id: current_user.id)
    redirect_to "/contacts"
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
    @contact.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio], latitude: params[:latitude], longitude: params[:longitude])
    redirect_to "/contacts/#{@contact_id}"
  end

  def destroy
    @contact_id = params[:id]
    @contact = Contact.find_by(id: @contact_id)
    @contact.destroy
  end
  def search
    search_term = params[:search]
    @all_contacts = Contact.where("first_name LIKE ? OR last_name like ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end
end
