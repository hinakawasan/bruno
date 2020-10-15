class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :title
      t.string :media_id
      t.string :explanation
      t.references :genre, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
