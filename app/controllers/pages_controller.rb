class PagesController < ApplicationController
  # ログイン前でも見れるようにする
  skip_before_action :authenticate_user!, only: [:select_role], raise: false

  def select_role
  end
end