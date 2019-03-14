class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :attachments, [:lesson_id, :created_at]
  end
end
