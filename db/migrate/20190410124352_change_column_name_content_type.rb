class ChangeColumnNameContentType < ActiveRecord::Migration[5.1]
  def change
    rename_column :contents, :type, :content_type
  end
end
