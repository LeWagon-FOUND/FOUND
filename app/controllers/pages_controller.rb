class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :public ]
  before_action :set_user, only: [:public, :dashboard, :generate]

  def home
  end

  def dashboard
    @chatrooms = Chatroom.where(user_id: current_user).or(Chatroom.where(finder_user_id: current_user))
  end

  def generate
    url = "http://localhost:3000/public_profile/#{@user.id}"
    @user.svg = get_svg_code(url)
    @user.save
    redirect_to dashboard_path
  end

  def public
    @user = User.find(params[:id])
    @chatroom = Chatroom.new
    @finder = User.new
  end

  private

  def set_user
    @user = current_user
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
