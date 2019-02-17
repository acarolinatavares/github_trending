class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.integer :external_id
      t.integer :size
      t.integer :stargazers_count
      t.integer :watchers_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.integer :owner_id
      t.string :node_ide
      t.string :name
      t.string :full_name
      t.string :html_url
      t.string :description
      t.string :url
      t.string :homepage
      t.string :language
      t.string :master_branch
      t.string :default_branch
      t.boolean :private
      t.boolean :fork
      t.date :pushed_at

      t.timestamps
    end

  end
end