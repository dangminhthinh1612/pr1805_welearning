class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :buy_times
      t.float :rate
      t.integer :price
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :courses, [:category_id, :created_at]
  end
end
