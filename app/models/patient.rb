#http://stackoverflow.com/questions/18956784/import-and-parse-spreadsheet-excel-files-in-ruby
#http://stackoverflow.com/questions/2817506/import-excel-into-rails-app
#https://github.com/continuum/active_importer
class Patient < ActiveRecord::Base
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]
          patient = find_by_id(row["id"]) || new
          patient.save!
        end
    end
    
    def self.open_spreadsheet(file)
        Excel.new(file.path, nil, :ignore)
    end
    
    def self.all_headers
        ["Name", "Gender", "Start Date", "End-Date"]
    end
end