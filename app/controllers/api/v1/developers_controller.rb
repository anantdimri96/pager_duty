module Api
  module V1
    class DevelopersController < ApplicationController

      def create
        developer = Developer.new(create_params)
        if developer.save
          render json: {status: "success"}, status: :ok
        else
          render json: {status: "failure", message: "Creation failed"}, status: :not_acceptable
        end
      end


      private

      def create_params
        {
            name: params[:name],
            phone_number: params[:phone_number],
            team_id: params[:team_id]
        }
      end

      def developer_params
        params.require(:developer).permit(:name,:phone_number,:team_id)
      end

    end
  end
end



# Sample request:
# {"team":
#     {"name": "claims"},
#   "developers": [
#       {"name": "someone", "phone_number":#     "9999999999"},
#       {"name": "somebody", "phone_number": "9111111111"}
#   ]
# }