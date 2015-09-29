class CreateJobTests < ActiveRecord::Migration
  def change
    create_table :job_tests do |t|
      t.string :title
      t.text :description
      t.string :file

      t.timestamps null: false
    end
  end
end
