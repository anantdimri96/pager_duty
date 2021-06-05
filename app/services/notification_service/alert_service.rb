module NotificationService
  class AlertService
    require "net/http"
    require "uri"
    extren e

    def initialize(team_id)
      @team_id = team_id
    end

    def call
        ext
    end

    private

    def send_notification
      return failure_params("No devs in the team") if devs.empty?
      data = {
          phone_number: "9999999999",
          message: "Too many 5xx"
      }

      return success_params(data)
    end

    def ext

      uri = URI.parse("https://run.mocky.io/v3/fd99c100-f88a-4d70-aaf7-393dbbd5d99f")
      params = send_notification

      response = Net::HTTP.post_form(uri, params.data)

      return {
          code: response.code,
          body: response.body["success"],
          success: true

      }

    end

    def team
      Team.find_by(id: @team_id) || nil
    end

    def devs
     return team.developers if team.present?
      []
    end

    def selected_dev
      l = devs.length
      index = Random.rand(1...l)
      devs[index]
    end

    def failure_params(msg)
      OpenStruct.new(success?: false,
                     message: msg)
    end

    def success_params(data)
      OpenStruct.new(success?: true, data: data)
    end


  end
end
