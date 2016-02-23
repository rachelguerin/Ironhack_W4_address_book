class AddFavouriteToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favourite, :string
  end
end
