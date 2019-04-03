class CreateUserCourseLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :user_course_lessons do |t|
      t.integer :user_course_id
      t.integer :lesson_id
      t.string :status

      t.timestamps
    end
    add_index :user_course_lessons, :user_course_id
    add_index :user_course_lessons, :lesson_id
    add_index :user_course_lessons, [:user_course_id, :lesson_id], unique: true
  end
end
