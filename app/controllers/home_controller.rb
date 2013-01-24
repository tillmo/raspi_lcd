class HomeController < ApplicationController
  def index
    session[:menu] = 'main_menu' if session[:menu].blank?
    session[:device] = OURDEVICES.first[0] if session[:device].blank?
  end
  def push_button
    render '/home/index'
  end
end
