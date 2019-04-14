class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :comment
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
