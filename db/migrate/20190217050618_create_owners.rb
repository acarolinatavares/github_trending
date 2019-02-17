class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.integer :external_id, unique: true
      t.string :login
      t.string :avatar_url
      t.string :url
      t.string :type

      t.timestamps
    end

  end
end
