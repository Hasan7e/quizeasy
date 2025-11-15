class CreateAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :attempts do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :name
      t.integer :score
      t.datetime :finished_at

      t.timestamps
    end
  end
end
