class PagesController < ApplicationController
  def home
    @first_contact = Contact.first
  end

  def index
    @all_contacts = Contact.all
  end

end
