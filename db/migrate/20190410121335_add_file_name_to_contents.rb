class AddFileNameToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :file_name, :string
  end
end
