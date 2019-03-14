class CreateExcercises < ActiveRecord::Migration[5.1]
  def change
    create_table :excercises do |t|
      t.string :excercise_name
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :excercises, [:lesson_id, :created_at]
  end
end
