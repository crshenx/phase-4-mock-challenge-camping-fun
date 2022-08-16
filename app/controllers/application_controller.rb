class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid     
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found      
  private       
  def record_invalid(e)         
    render json: {errors: e.record.errors.full_messages }, status: :unprocessable_entity     
  end      
  # def record_not_found         
  #   render json: {error: "Camper not found"}, status: :not_found     
  # end
end
