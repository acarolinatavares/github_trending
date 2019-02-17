class CreateOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :owners do |t|
      t.integer :external_id
      t.string :login
      t.string :node_id
      t.string :avatar_url
      t.string :gravatar_id
      t.string :url
      t.string :received_events_url
      t.string :type

      t.timestamps
    end

  end
end
