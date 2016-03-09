class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string 'name'
      t.string 'gender'
      t.datetime 'start_date'
      t.datetime 'end_date'
    end
  end
end
