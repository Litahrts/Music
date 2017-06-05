class Users::SessionsController < Devise::SessionsController
  def create
    super

    if resource.save
      resource.profiles.create!()

  end
end
