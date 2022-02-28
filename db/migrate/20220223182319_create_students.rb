class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :course_id, foreign_key: true

      t.timestamps
    end
  end
end
