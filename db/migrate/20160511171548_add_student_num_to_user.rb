class AddStudentNumToUser < ActiveRecord::Migration
  def change
    add_column :users, :student_num, :string
  end
end
