class AddDistanceToTargetToGuesses < ActiveRecord::Migration[7.1]
  def change
    add_column :guesses, :distance_to_target, :integer
  end
end
