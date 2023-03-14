class BoardgamesController < ApplicationController
  before_action :set_boardgame, only: %i[ show edit update destroy ]

  # GET /boardgames
  def index
    # @boardgames = Boardgame.all
    @boardgames = policy_scope(Boardgame)

    @markers = @boardgames.geocoded.map do |boardgame|
      {
        lat: boardgame.latitude,
        lng: boardgame.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { boardgame: boardgame }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  # GET /boardgames/1
  def show
    authorize @boardgame
  end

  # GET /boardgames/new
  def new
    @boardgame = Boardgame.new
    authorize @boardgame
  end

  # GET /boardgames/1/edit
  def edit
    authorize @boardgame
  end

  # POST /boardgames
  def create
    @boardgame = Boardgame.new(boardgame_params)
    @boardgame.user = current_user
    authorize @boardgame
    if @boardgame.save
      redirect_to @boardgame, notice: "Boardgame was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boardgames/1
  def update
    authorize @boardgame
    if @boardgame.update(boardgame_params)
      redirect_to @boardgame, notice: "Boardgame was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /boardgames/1
  def destroy
    authorize @boardgame
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
