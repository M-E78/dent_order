class Profiles::ProfilesController < ApplicationController
  # 「詳細設定画面」そのもので無限ループしないよう、チェックをスキップします
  skip_before_action :check_profile_completion, only: [ :edit, :update ]

  def edit
    # 医院か技工所、どちらか所属している方を取得
    @organization = current_user.clinic || current_user.lab
  end

  def update
    @organization = current_user.clinic || current_user.lab
    if @organization.update(organization_params)
      redirect_to root_path, notice: "詳細情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def organization_params
    # 所属先が Clinic か Lab かによって、許可するキーを切り替えます
    key = @organization.is_a?(Clinic) ? :clinic : :lab
    params.require(key).permit(:name, :postal_code, :address, :phone_number)
  end
end
