class ContactsController < ApplicationController
	def index
		@contacts = Contact.get_contacts_list
	end

	def new
		@err = params[:err]
	end

	def create

		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone_number => params[:contact][:phone],
			:email_address => params[:contact][:email]
		)

		if contact.check
			contact.save
			redirect_to('/contacts')
		else
			redirect_to('/contacts/new/error')
		end 

	end

	def show
		# render(:text => params[:id].inspect)
		@contact = Contact.get_contact(params[:id])
	end
end
