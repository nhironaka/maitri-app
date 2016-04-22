class AddColumnsFromExcel < ActiveRecord::Migration
  def change
    remove_column :patients, :name, :string
    remove_column :patients, :gender, :string
    remove_column :patients, :start_date, :datetime 
    remove_column :patients, :end_date, :datetime
    for i in 1..60
      add_column :patients, i.to_words, :string
    end
  end
end
