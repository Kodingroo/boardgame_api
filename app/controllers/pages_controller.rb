class PagesController < ApplicationController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @game_archives = GameArchive.all
    @hello = "Hello"
  end
end
