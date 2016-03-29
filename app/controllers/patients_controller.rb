class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    def patient_params
        params.require(:patient).permit(:name, :gender, :start_date, :end_date)
    end
    
    def index
      if sort_column and sort_direction
        @patients = Patient.order(sort_column + " " + sort_direction)
      else 
        @patients = Patient.all
      end
    end
    
    def import
      workbook = RubyXL::Parser.parse("file/patients.xlsx");
    end
      
    private
  
    def sort_column
      params[:sort]
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end