module Api
  module V1
    class TeamsController < ApplicationController

      def create
        # response = ::TeamsService::CreateService.new(create_params).call
        team = Team.new(create_params)
        if team.save
          render json: {status: "success"}, status: :ok
        else
          render json: {status: "failure", message: "Creation failed"}, status: :not_acceptable
        end
      end


      private

      def create_params
        {
            name: params[:name]
        }
      end

      def team_params
        params.require(:team).permit(:name)
      end

      # def team_params
      #   params.require(:transaction).permit(:type, :amount, :parent_id, :transaction_id)
      # end

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