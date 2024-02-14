class CreateApiAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :api_accesses do |t|
      t.string :email
      t.text :access_token

      t.timestamps
    end
  end
end
