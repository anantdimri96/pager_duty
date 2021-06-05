module TeamsService
  class CreateService

    def initialize(params)
      @params = params
    end

    def call
      prepare_teams
    end

    private

    def create_teams
      {
          name: params[:name]
      }
    end

    def prepare_teams
        team = Team.new(create_params)

        if team.save
          return success_params
        else
          return failure_params("creation failure")
        end
    end

    def success_params
      OpenStruct.new(success?: true)
    end

    def failure_params(msg)
      OpenStruct.new(success?: false,
                     message: msg)
    end
  end
end
