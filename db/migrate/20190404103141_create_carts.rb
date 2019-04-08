class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true
      t.boolean :paid, default: false

      t.timestamps
    end
    add_index :carts, [:user_id, :created_at]
    add_index :carts, [:course_id, :created_at]
    add_index :carts, [:user_id, :course_id], unique: true
  end
end
