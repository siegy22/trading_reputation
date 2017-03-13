module Admin
  class GamesController < Admin::BaseController
    def index
      @games = Game.ordered
    end

    def new
      @game = Game.new
    end

    def create
      @game = Game.new(game_params)
      if @game.save
        redirect_to :admin_games, notice: "Game created!"
      else
        render "new"
      end
    end

    def edit
      @game = Game.find(params[:id])
    end

    def update
      @game = Game.find(params[:id])
      if @game.update(game_params)
        redirect_to :admin_games, notice: "Game updated!"
      else
        render "edit"
      end
    end

    def destroy
      @game = Game.find(params[:id])
      @game.destroy
      redirect_to :admin_games, notice: "Game deleted!"
    end

    private
    def game_params
      params.require(:game).permit(:name, :image)
    end
  end
end
