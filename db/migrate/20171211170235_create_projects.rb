class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image
      t.string :short_desc
      t.text :long_desc
      t.string :project_link

      t.timestamps
    end
  end
end
