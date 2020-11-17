require 'rqrcode'

class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :public ]
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :public]

  def show
  end

  def create
    url = "http://localhost:3000/public_profile/#{current_user.id}"
    profile = Profile.new(profile_params)
    profile.user = current_user
    profile.svg = get_svg_code(url)
    # profile.qrcode.attach(io: svg, filename: 'qrcode.svg', content_type: 'image/svg')
    if profile.save
      redirect_to profile_path(current_user)
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
    @profile = User.find(params[:id]).profile
  end

  def get_svg_code(url)
    qrcode = RQRCode::QRCode.new(url)
    svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end
end
