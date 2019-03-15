class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :lesson_title
      t.string :lesson_status
      t.string :lesson_content
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :lessons, [:course_id, :created_at]
  end
end
