require 'raspi_lcd/raspi_lcd'

module RaspiLCD
  DIRECTIONS = [:up, :left, :center, :right, :down]

  def buttons
    DIRECTIONS.select{|d| button(d)}
  end  

  def buttons_pressed
    DIRECTIONS.select{|d| button_pressed(d)}
  end
  
  # print a string with the encoding used by the Raspi LCD interface
  # requires ruby 1.9
  def print_encoded_xy(x,y,s)
    print_xy(x,y,s.encode("CP852"))
  end  
end
