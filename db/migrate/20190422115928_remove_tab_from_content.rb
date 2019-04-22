class RemoveTabFromContent < ActiveRecord::Migration[5.1]
  def change
    remove_column :contents, :tab, :integer
  end
end
