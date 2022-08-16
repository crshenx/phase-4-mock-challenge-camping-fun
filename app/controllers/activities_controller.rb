class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index
        activity = Activity.all
        render json: activity, status: :ok
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end

    #   def find_activity
    #     Activity.find(params[:id])
    #   end
    private

    def record_not_found         
        render json: {error: "Activity not found"}, status: :not_found     
      end
    
    #   def activity_params
    #     params.permit(:name)
    # end
    
end
