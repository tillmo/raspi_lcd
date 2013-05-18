require 'raspi_lcd/raspi_lcd'

module RaspiLCD
  DIRECTIONS = [:up, :left, :center, :right, :down]

  def buttons
    DIRECTIONS.select{|d| button(d)}
  end  

  def buttons_pressed
    DIRECTIONS.select{|d| button_pressed(d)}
  end  
end
