class RemoveLessonContentFromLesson < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :lesson_content, :string
  end
end
