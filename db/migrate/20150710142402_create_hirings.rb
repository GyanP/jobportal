class CreateHirings < ActiveRecord::Migration
  def change
    create_table :hirings do |t|
      t.integer :user_id
      t.integer :job_id
      t.integer :applicant_id
      t.timestamps
    end
  end
end
