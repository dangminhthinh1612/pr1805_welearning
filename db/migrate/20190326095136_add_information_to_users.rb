class AddInformationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :address, :string
    add_column :users, :id_card, :string
  end
end
