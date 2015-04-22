class RegistrationsController < Devise::RegistrationsController
  http_basic_authenticate_with name: 'tuomas', password: 'brain vs AI'
  def new
    super
  end
end
