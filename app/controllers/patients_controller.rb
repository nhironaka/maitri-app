class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    def patient_params
        params.require(:patient).permit(:name, :gender, :start_date, :end_date)
    end
    
    def show
      id = params[:patient_id] 
      @patient = Patient.find(id) 
      #render(:partial => 'show', :object => @patient) if request.xhr?
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
    
    def show
      @patient = Patient.find(params[:id])
      #redirect_to "/patients/show"
    end
    
    def reports
      flash[:notice] = "This is the report page"
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