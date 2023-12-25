class ChangeNullConstraintInSubjects < ActiveRecord::Migration[7.1]
  def change
    change_column_null :subjects, :category_id, false
  end
end
