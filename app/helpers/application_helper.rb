require 'net/http'
require 'uri'
module ApplicationHelper
  @@headers = ['Only_Active_Residents', 'First_Name',	'Middle_Initial',	'Last_Name', 'Nickname', 'Suffix',	'Marital_status',	
               'Birthday', 'Gender', 'Race', 'Language',	'Religion',	'SSN',	'Medicare',
               'Medicaid', 'Residency_Start',	'Residency_End', 'Apartment_Number',	'Phone',	'task_Rating', 'hospital_Preference',
                'funeral_Home_Pref',	'pharmacy_Preference',	'pharmacy_Phone',	'Do_Not_Resuscitate',	'Health_Care_Power_of_Attorney', 'HCPOA_Activated?', 'Living_Will',	
                'Advanced_Directives',	'Allergies',	'Last_Pneumonia_shot',	'Last_Flu_Shot', 'Last TB Test',	'Insurance_1_Label',	'Insurance_1_Value',	
                'Insurance_2_Label', 'Insurance_2_Value',	'Insurance_3_Label',	'Insurance_3_Value', 'Preferred_Pronouns',	'Admission_Viral_Load_Date',	'Admission_Viral_Load',	
                'Admission_CD4_Count_Date',	'Admission_CD4_Count', 'Admission_Karnofsky_Score', 'Status_(ie:Respite/EOL/hospice)',	'Substance_Use_Hx',	'Criminal_Hx', 'Psychiatric_Dx',	
                'Address_of_Permanent_Residence',	'Resident_Cell_Phone_number',	'Resident_Home_Phone_number_At_Permanent_Residence', 'AHP_Contract_Start_Date',	'AHP_Contract_End_Date', 'ADAP', 'Notes']
  @@map = Hash[@@headers.zip [*1..56].collect{|val| val.to_words.to_sym}]  
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, patients_overview_path({:sort => mapper(column), :direction => direction}), {:class => css_class}
  end
  
  def is_sign_in_path?
    !(request.original_url =~ /\/users\/sign_in/).nil?
  end
  
  def is_user_auth?
    !(request.original_url =~  /\/users\/password/).nil?
  end
  
  def mapper (attribute)
    @@map[attribute]
  end
  
  def all_headers
     @@headers
  end
  
  def attr_map
    @@map
  end
  
  def singular_param(i)
    key="#{i}th_filter";
    val = params[key.to_sym]
    params.key(val) == key
  end
  
  def filterable
    #['Age (18-30)', 'Age (31-50)', 'Age (51-60)', 'Age (61+)'] + 
    all_headers.drop(1).map{|a| [a.split("_").join(" "), a]}
  end
  
end
