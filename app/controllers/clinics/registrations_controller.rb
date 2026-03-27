class Clinics::RegistrationsController < Devise::RegistrationsController
  def new
    # 空のユーザー(User)を、医院(Clinic)に紐付いた状態で1人分用意する
    build_resource({})
    resource.build_clinic # ユーザーに紐付いた空の医院を作る
    respond_with resource
  end

  protected

  def sign_up_params
    params.require(:user).permit(
      :name,
      :email, 
      :password, 
      :password_confirmation, 
      clinic_attributes: [:name, :address, :phone_number]
    )
  end
end
