class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.references :seller, index: true, null: false, foreign_key: { on_delete: :cascade }
      t.references :city, index: true, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
