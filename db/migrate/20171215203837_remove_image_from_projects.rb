class RemoveImageFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :image, :string
  end
end
