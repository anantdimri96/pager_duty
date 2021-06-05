module Api
  module V1
    class NotificationsController < ApplicationController
      before_action :notification_params, only: [:alert]

      def alert
        response = ::NotificationService::AlertService.new(notification_params).call
        if response.success?
          render json: {status: response.success?}, status: :ok
        else
          render json: {status: response.success?}, status: :not_acceptable
        end
      end


      private

      def notification_params
        {
            team_id: params[:team_id].to_i
        }
      end

      def team_params
        params.require(:team).permit(:team_id)
      end

    end
  end
end


# POST https://run.mocky.io/v3/fd99c100-f88a-4d70-aaf7-393dbbd5d99f
# Sample request: {"phone_number": "9999999999", "message": "Too many 5xx!"} -> to be randomly selected via
# team id