class RegistrationsController < ApplicationController
  def new
    registration = Registration.new
    render :new, locals: { registration: registration }
  end

  def create
    registration = Registration.new params.require(:registration).permit(:email, :name, :note)
    if registration.save
      redirect_to home_index_path, notice: I18n.t(:registration_created)
    else
      render :new, locals: { registration: registration }
    end
  end
end
