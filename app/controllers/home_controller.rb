MAIN_MENU = 0
PROGRAM_SELECTION = 1
TIME_SELECTION = 2
WAIT_FOR_START = 3

class HomeController < ApplicationController
  def index
    session[:menu] = MAIN_MENU if session[:menu].blank?
    session[:device] = 0 if session[:device].blank?
    session[:program] = [0] if session[:program].blank?
    session[:level] = 0 if session[:level].blank?

    @device = OURDEVICES.to_a[session[:device].to_i]
  end
  def push_button
    case session[:menu]
      when MAIN_MENU then
        case params[:dir]
          when 'up' then session[:device] -= 1
          when 'down' then session[:device] += 1
          when 'center', 'right' then session[:menu] += 1
          when 'left' then session[:menu] -= 1
        end
      when PROGRAM_SELECTION then
        case params[:dir]
          when 'up', 'down' then
            session[:program][session[:level]] += if params[:dir] == 'up' then -1 else 1 end
            if session[:level] < session[:program].length then session[:program] = session[:program][0..session[:level]]
            end
          when 'center', 'right' then 
            if @device.depth < session[:level] then 
              session[:level] += 1
            else
              session[:menu] += 1
            end
            session[:program] << 0 unless session[:program].length > session[:level]
          when 'left' then session[:level] -= 1
        end 
    end

    session[:device] %= NUMBER_OF_DEVICES
    redirect_to '/home/index'
  end
end
