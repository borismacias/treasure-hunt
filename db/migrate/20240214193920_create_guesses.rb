class CreateGuesses < ActiveRecord::Migration[7.1]
  def change
    create_table :guesses do |t|
      t.references :user, null: false, foreign_key: true
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
