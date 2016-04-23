class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    @@headers = ['Only_Active_Residents', 'First_Name',	'Middle_Initial',	'Last_Name', 'Nickname', 'Suffix',	'Marital_status',	
               'Birthday', 'Gender', 'Race', 'Language',	'Religion',	'SSN',	'Medicare',
               'Medicaid', 'Residency_Start',	'Residency_End', 'Apartment_Number',	'Phone',	'task_Rating', 'hospital_Preference',
                'funeral_Home_Pref',	'pharmacy_Preference',	'pharmacy_Phone',	'Do_Not_Resuscitate',	'Health_Care_Power_of_Attorney', 'HCPOA_Activated?', 'Living_Will',	
                'Advanced_directives',	'Allergies',	'Last_Pneumonia_shot',	'Last_flu_shot', 'Last TB Test',	'Insurance_1_Label',	'Insurance_1_Value',	
                'Insurance_2_Label', 'Insurance_2_Value',	'Insurance_3_Label',	'Insurance_3_Value', 'Preferred_Pronouns',	'Admission_Viral_Load_Date',	'Admission_Viral_Load',	
                'Admission_CD4_Count_Date',	'Admission_CD4_Count', 'Admission_Karnofsky_Score', 'Status_(ie:Respite/EOL/hospice)',	'Substance_Use_Hx',	'Criminal_Hx', 'Psychiatric_Dx',	
                'Address_of_Permanent_Residence',	'Resident_Cell_Phone_number',	'Resident_Home_Phone_number_At_Permanent_Residence', 'AHP_Contract_Start_Date',	'AHP_Contract_End_Date', 'ADAP', 'Notes']
    @@map = Hash[@@headers.zip [*1..56].collect{|val| val.to_words}]
    def patient_params
        params.require(:patient).permit(:two, :three, :sixteen, :seventeen)
    end
    
    def show
      id = params[:patient_id] 
      @patient = Patient.find(id) 
    end
    
    def index
      if sort_column and sort_direction
        @patients = Patient.order(sort_column + " " + sort_direction)
      else
        @patients = Patient.all
      end
      if not start_date.nil? and not start_date.empty?
        @patients = @patients.where('sixteen > ?', start_date)
      end
      if not end_date.nil? and not end_date.empty?
        @patients = @patients.where('seventeen < ?', end_date)
      end
    end
    
    def show
      import = params[:import]
      id = params[:patient_id]
      if import
        render "import_view"
        return
      end
      @patient = Patient.find(params[:id])
    end
    
    def reports
      @patients = Patient.all
      for i in 1..5
        filter =params["#{i}th_filter".to_sym]
        cond = params["#{i}th_condition".to_sym]
        val = params["value#{i}".to_sym]
        if !filter.nil?
          k = @@map[filter]
          if cond == "less_than"
            @patients = @patients.where("? < #{k}", val)
          elsif cond == "greater_than"
            @patients = @patients.where("? > #{k}", val)
          else 
            @patients = @patients.where("? == #{k}", val)
          end
        else
          return @patients
        end
      end
    end
      
    def import_excel
      Patient.delete_all
      file = params[:file]
      patients_sheets = Roo::Spreadsheet.open(file)
      patients_sheets.each_with_pagename do |name, sheet|
        sheet.drop(1).each do |row|
          attrbs = {}
          i=1;
          row.each do |val|
            key = i.to_words.split('-').join('_').to_sym
            attrbs[key]=val
            i += 1
          end
          Patient.create!(attrbs)
        end
      end
      redirect_to patients_overview_path
    end  
    
    private
  
    def sort_column
      params[:sort]
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    def start_date
      params[:start_date]
    end
    
    def end_date
      params[:end_date]
    end
end