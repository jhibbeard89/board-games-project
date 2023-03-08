class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: %i[ show edit update destroy ]

  # GET /boardgames
  def index
    @boardgames = Boardgame.all
  end

  # GET /boardgames/1
  def show
  end

  # GET /boardgames/new
  def new
    @boardgame = Boardgame.new
  end

  # GET /boardgames/1/edit
  def edit
  end

  # POST /boardgames
  def create
    @boardgame = Boardgame.new(boardgame_params)

    if @boardgame.save
      redirect_to @boardgame, notice: "Boardgame was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boardgames/1
  def update
    if @boardgame.update(boardgame_params)
      redirect_to @boardgame, notice: "Boardgame was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /boardgames/1
  def destroy
    @boardgame.destroy
    redirect_to boardgames_url, notice: "Boardgame was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boardgame
      @boardgame = Boardgame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def boardgame_params
      params.require(:boardgame).permit(:name)
    end
end
