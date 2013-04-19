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
    session[:time] = [1, 2, 3, 4] if session[:time].blank?
    session[:tindex] = 0 if session[:tindex].blank?

    @device = OURDEVICES.to_a[session[:device].to_i]
  end
  def push_button
    @device = OURDEVICES.to_a[session[:device].to_i]
    case session[:menu]
      when MAIN_MENU then
        case params[:dir]
          when 'up', 'down' then session[:device] += if params[:dir] == 'up' then -1 else 1 end
            session[:program] = [0]
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
            if has_next(@device,session[:level],session[:program]) then 
              session[:level] += 1
            else
              session[:menu] += 1
            end
            session[:program] << 0 unless session[:program].length > session[:level]
          when 'left' then
           if session[:level] > 0 
           then session[:level] -= 1
           else session[:menu] -= 1
           end
       end           
      when TIME_SELECTION then
        case params[:dir]
          when 'right' then session[:tindex]+=1
          when 'left' then session[:tindex]-=1
          when 'center' then session[:menu] += 1
          when 'up', 'down' then 
            session[:time][session[:tindex]] += if params[:dir] == 'up' then 1 else -1 end
            if session[:tindex] == 0 then session[:time][session[:tindex]] %= 3 end
            if session[:tindex] == 1 then session[:time][session[:tindex]] %= 10 end
            if session[:tindex] == 2 then session[:time][session[:tindex]] %= 6 end
            if session[:tindex] == 3 then session[:time][session[:tindex]] %= 10 end
        end
      end

    if session[:menu] < 0 then session[:menu] = 0 end   
    if session[:level] < 0 then session[:level] = 0 end   
    session[:device] %= NUMBER_OF_DEVICES
    menu_depth = @device[1]
    for i in (0..session[:program].length-2) do
      menu_depth = menu_depth.to_a[session[:program][i]][1] 
    end
    session[:program][-1] %= menu_depth.length 
    redirect_to '/home/index'
  end
  
  private
  def has_next(device,level,program)
    selection = device
    for i in (0..level)
      logger.warn "selection #{selection.inspect}"
      puts "selection #{selection.inspect}"
      if selection.nil? then return false end
      selection = selection[1].to_a[program[i]]
    end
    return selection[1].to_a[0][1].class == Hash
  end
end
