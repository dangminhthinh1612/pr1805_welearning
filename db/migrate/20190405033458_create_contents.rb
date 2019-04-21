class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.integer :lesson_id
      t.string :text
      t.integer :type
      t.integer :tab

      t.timestamps
    end
  end
end
