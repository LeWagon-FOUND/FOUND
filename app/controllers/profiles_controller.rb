class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :public ]
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :public]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(profile_params)
    profile.user = current_user
    if profile.save
      redirect_to profile_path(profile)
    else
      render :new
    end

  end

  def update
  end

  def public
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :birthday, :phone_number, :generic_message, :avatar)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
