require 'net/http'
require 'uri'
module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, patients_overview_path({:sort => all_attrbs.index(column), :direction => direction}), {:class => css_class}
  end
  
  def is_sign_in_path?
    !(request.original_url =~ /\/users\/sign_in/).nil?
  end
  
  def is_user_auth?
    !(request.original_url =~  /\/users\/password/).nil?
  end
  
  private
  def all_headers
    @headers = ['Only Active Residents', 'First Name',	'Middle Initial',	'Last Name',	'Nickname',	'	Suffix',	'	Marital Status',	
                'Birthday',	'Gender',	'Race',	'Language',	'Religion',	'Social Security Number',	'Medicare',	
                'Medicaid',	'Residency',	'Start',	'Residency End',	'Apartment Number',	'Phone',	'Task Rating',	
                'Hospital Preference',	'Funeral Home Pref',	'Pharmacy Preference',	'Pharmacy Phone',	'Do Not Resuscitate',	'Health Care',	'Power of Attorney',	
                'HCPOA Activated?',	'Living Will',	'Advanced Directives',	'Allergies',	'Last Pneumonia',	'Shot',	'Last Flu Shot',	
                'Last TB Test',	'Insurance 1 Label',	'Insurance 1 Value',	'Insurance 2 Label', 'Insurance 2 Value',	'Insurance 3 Label',	'Insurance 3 Value',	
                'Preferred Pronouns',	'Admission Viral Load Date',	'Admission Viral Load',	'Admission CD4 Count Date',	'Admission CD4 Count',	'Admission Karnofsky Score',	
                'Status (ie respite/EOL/hospice)',	'Substance Use Hx',	'Criminal Hx',	'Psychiatric Dx',	'Address of permanent residence',	'Resident cell phone number',	'Resident home phone number at permanent residence',	
                'AHP Contract Start Date',	'AHP Contract End Date',	'ADAP',	'Notes']
  end
  
  def all_attrbs
    @attrbs = []
    for i in 1..56
      @attrbs.push(i.to_words)
    end
    return @attrbs
  end
  
end
