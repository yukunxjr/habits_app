class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.float :time
      t.date :date
      t.references :skill
	    t.references :user
      t.timestamps
    end
  end
end
