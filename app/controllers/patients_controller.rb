class PatientsController < ApplicationController
  
    helper_method :sort_column, :sort_direction
    
    def patient_params
        params.require(:patient).permit(:name, :gender, :start_date, :end_date)
    end
    
    def index
        @patients = Patient.order(sort_column + " " + sort_direction)
    end
    
    private
  
    def sort_column
      params[:sort]
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end