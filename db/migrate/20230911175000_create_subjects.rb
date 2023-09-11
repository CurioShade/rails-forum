class CreateSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :category
      t.text :details

      t.timestamps
    end
  end
end
