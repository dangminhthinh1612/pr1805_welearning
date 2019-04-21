class ChangeDataTypeContent < ActiveRecord::Migration[5.1]
  def change
    change_column :contents, :type, :integer, null: false, default: 0
  end
end
