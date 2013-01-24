class HomeController < ApplicationController
  def index
    session[:menu] = 'main_menu' if session[:menu].blank?
    session[:device] = 0 if session[:device].blank?
    @device = OURDEVICES.to_a[session[:device].to_i]
  end
  def push_button
    case params[:dir]
      when 'up' then session[:device] -= 1
      when 'down' then session[:device] += 1
      end
    redirect_to '/home/index'
  end
end
