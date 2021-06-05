module DevelopersService
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

    end

  end
end
