class ChangeDescriptionInSubjects < ActiveRecord::Migration[7.1]
  def change
    change_column :subjects, :description, :string
  end
end
