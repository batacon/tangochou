class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.text :front_text, null: false
      t.text :back_text, null: false
      t.date :last_done_at
      t.integer :done_count, null: false, default: 0

      t.timestamps
    end
  end
end
