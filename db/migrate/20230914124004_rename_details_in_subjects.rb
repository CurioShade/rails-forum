class RenameDetailsInSubjects < ActiveRecord::Migration[7.0]
  def change
    rename_column :subjects, :details, :description
  end
end
