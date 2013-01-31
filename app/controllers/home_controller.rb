MAIN_MENU = 0
PROGRAM_SELECTION = 1
TIME_SELECTION = 2
WAIT_FOR_START = 3

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
      when 'center' then session[:menu] += 1
    end
    session[:device] %= NUMBER_OF_DEVICES
    redirect_to '/home/index'
  end
end
