class TopController < ApplicationController
  # ログインしてない人はログイン画面へ飛ばす
  before_action :authenticate_user!
  def index
  end
end
