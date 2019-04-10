class Api::V1::GameArchivesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_game_archive, only: [ :show, :update, :destroy ]

  def index
    @game_archives = policy_scope(GameArchive)
  end

  def show
  end

  def update
    if @game_archive.update(game_archive_params)
      render :show
    else
      render_error
    end
  end

   def create
    @game_archive = GameArchive.new(game_archive_params)
    @game_archive.user = current_user
    authorize @game_archive
    if @game_archive.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @game_archive.destroy
    # head :no_content
    render json: { message: "Removed" }
  end

  private

  def game_archive_params
    params.require(:game_archive).permit(:game_name, :game_rank, :playing_time, :category, :mechanic, :designer, :image_url, :thumb_url)
  end

  def render_error
    render json: { errors: @game_archive.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_game_archive
    @game_archive = GameArchive.find(params[:id])
    authorize @game_archive  # For Pundit
  end

end
