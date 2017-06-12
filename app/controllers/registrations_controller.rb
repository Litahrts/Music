class RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  def create
    super

    if resource.save
      resource.create_profile
    end
  end

  protected

  def update_resource(resource, params)
    params.delete :current_password
    resource.update_without_password(params)
  end

end
