class AddColumnsFromExcel < ActiveRecord::Migration
  def change
    remove_column :patients, :name, :string
    remove_column :patients, :gender, :string
    remove_column :patients, :start_date, :datetime 
    remove_column :patients, :end_date, :datetime
    add_column :patients, :one, :integer
    for i in 2..60
      add_column :patients, i.to_words.split(' ').join('_').to_sym, :string
    end
  end
end
