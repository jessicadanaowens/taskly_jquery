class Tasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.integer :task_list_id
      t.date :due_date
    end
  end
end
