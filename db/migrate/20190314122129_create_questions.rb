class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question_content
      t.references :excercise, foreign_key: true

      t.timestamps
    end
    add_index :questions, [:excercise_id, :created_at]
  end
end
