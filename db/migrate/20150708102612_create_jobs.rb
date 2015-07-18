class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :job_title
      t.text :job_description
      t.string :job_state
      t.string :job_city
      t.string :job_street
      t.string :job_zip
      t.float :job_latitude
      t.float :job_longitude
      t.string :current_status
      t.timestamps
    end
  end
end
