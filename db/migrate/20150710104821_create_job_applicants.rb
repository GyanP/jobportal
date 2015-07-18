class CreateJobApplicants < ActiveRecord::Migration
  def change
    create_table :job_applicants do |t|
      t.integer :job_id
      t.integer :applicant_id
      t.timestamps
    end
  end
end
