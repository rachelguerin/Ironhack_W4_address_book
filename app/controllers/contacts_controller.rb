class ContactsController < ApplicationController
	def index
		@contacts = Contact.get_contacts_list
	end

	def new
		@err = Contact.get_error(params[:err])
	end

	def create

		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone_number => params[:contact][:phone],
			:email_address => params[:contact][:email]
		)

		if contact.name.blank? || contact.address.blank? 
			redirect_to('/contacts/new/error_name')
		elsif contact.check_phone
			redirect_to('/contacts/new/error_phone')
		elsif contact.check_email
			redirect_to('/contacts/new/error_email')
		else
			contact.save
			redirect_to('/contacts')
		end

	end

	def show
		@contact = Contact.get_contact(params[:id])
	end

	def favourite
		contact = Contact.get_contact(params[:id])
		contact.set_favourite
		contact.save
		redirect_to('/contacts/favourites')
	end

	def favourites
		@contacts = Contact.get_favourites_list

	end

	def search
		@contacts = Contact.where("name like '#{params[:search_term]}%'")
	end
end
