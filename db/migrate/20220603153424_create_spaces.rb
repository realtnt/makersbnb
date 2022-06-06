class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :title, null: false
      t.string :description, default: ''
      t.integer :price, null: false
      t.datetime :date_from, null: false
      t.datetime :date_to, null: false
      t.references :user, foreign_key: { on_delete: :cascade }
      t.string :image_url

      t.timestamps
    end
  end
end
