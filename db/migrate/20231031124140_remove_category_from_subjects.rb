class RemoveCategoryFromSubjects < ActiveRecord::Migration[7.1]
  def change
    remove_column :subjects, :category, :string
  end
end
