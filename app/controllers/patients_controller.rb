class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    def patient_params
        params.require(:patient).permit(:name, :gender, :start_date, :end_date)
    end
    
    def show
      import = params[:import]
      id = params[:patient_id]
      if import
        render "import_view"
        return
      end
      @patient = Patient.find(id) 
    end
    
    def index
      if sort_column and sort_direction
        @patients = Patient.order(sort_column + " " + sort_direction)
      else
        @patients = Patient.all
      end
      if not start_date.nil? and not start_date.empty?
        @patients = @patients.where('start_date > ?', start_date)
      end
      if not end_date.nil? and not end_date.empty?
        @patients = @patients.where('end_date < ?', end_date)
      end
    end
    
    def import_excel
      Patient.delete_all
      file = params[:file].path
      patients_sheets = RubyXL::Parser.parse(file)
      patients_sheets.each  do |patients_sheet| #starts on the second row
        patients_sheet.each do |row|
          name = row[1] + " " + row[3]
          Patient.create(name: name)
        end
      end
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