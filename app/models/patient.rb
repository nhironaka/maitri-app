#http://stackoverflow.com/questions/18956784/import-and-parse-spreadsheet-excel-files-in-ruby
#http://stackoverflow.com/questions/2817506/import-excel-into-rails-app
#https://github.com/continuum/active_importer
class Patient < ActiveRecord::Base
    #def self.import(file)
     #   spreadsheet = open_spreadsheet(file)
      #  header = spreadsheet.row(1)
       # (2..spreadsheet.last_row).each do |i|
        #  row = Hash[[header, spreadsheet.row(i)].transpose]
         # patient = find_by_id(row["id"]) || new
          #patient.save!
        #end
    #end
    
    #def self.open_spreadsheet(file)
     #   Excel.new(file.path, nil, :ignore)
    #end
    
    def self.all_headers
      @headers = ['Only Active Residents', 'First Name',	'Middle Initial',	'Last Name',	'Nickname',	'	Suffix',	'	Marital Status',	
                  'Birthday',	'Gender',	'Race',	'Language',	'Religion',	'Social Security Number',	'Medicare',	
                  'Medicaid',	'Residency Start',	'Residency End',	'Apartment Number',	'Phone',	'Task Rating',	
                  'Hospital Preference',	'Funeral Home Pref',	'Pharmacy Preference',	'Pharmacy Phone',	'Do Not Resuscitate',	'Health Care',	'Power of Attorney',	
                  'HCPOA Activated?',	'Living Will',	'Advanced Directives',	'Allergies',	'Last Pneumonia',	'Shot',	'Last Flu Shot',	
                  'Last TB Test',	'Insurance 1 Label',	'Insurance 1 Value',	'Insurance 2 Label', 'Insurance 2 Value',	'Insurance 3 Label',	'Insurance 3 Value',	
                  'Preferred Pronouns',	'Admission Viral Load Date',	'Admission Viral Load',	'Admission CD4 Count Date',	'Admission CD4 Count',	'Admission Karnofsky Score',	
                  'Status (ie respite/EOL/hospice)',	'Substance Use Hx',	'Criminal Hx',	'Psychiatric Dx',	'Address of permanent residence',	'Resident cell phone number',	'Resident home phone number at permanent residence',	
                  'AHP Contract Start Date',	'AHP Contract End Date',	'ADAP',	'Notes']
    end
    
    def self.all_attrbs
      @attrbs = []
      for i in 2..56
        @attrbs.push(i.to_words)
      end
    end
end