class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :success, null: false, foreign_key: true
      #t.references :message, null: false, foreign_key: true
      #t.references :emotion, null: false, foreign_key: true
      t.timestamps
    end
  end
end
