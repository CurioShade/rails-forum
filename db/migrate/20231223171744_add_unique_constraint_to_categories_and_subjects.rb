class AddUniqueConstraintToCategoriesAndSubjects < ActiveRecord::Migration[7.1]
  def change
    add_index :categories, :name, unique: true
    add_index :subjects, :title, unique: true
  end
end
