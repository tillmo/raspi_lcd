Ruby bindings for the raspberry pi LCD interface

Known issues:
- one needs to be root in order to run all this
- FIXED NOW: it seems that one needs to execute ext/RaspiLCD-V0.9.0/raspilcd first in order to see something on the display (you can quit raspilcd with ctrl+c immediately)

This gem provides a module RaspiLCD, with the following methods:

      clear_screen
      set_pen_color(color)
      set_fill_color(color)
      set_font(font)
      set_contrast(contrast)

      put_pixel(x,y,color)
      draw_line(x0,y0,x1,y1)
      draw_circle(x,y,radius)
      draw_ellipse(xm,ym,a,b)
      draw_rect(x0,y0,x1,y1,line)
      print_xy(x,y,string)
      print_encoded_xy(x,y,string) # use this one for umlauts etc. Requires ruby > 1.9
      draw_bitmap(x,y,bmp)

      init
      write_framebuffer

      raspi_lcd_hw_init
      update_buttons
      get_raspberry_hw_revision
      spi_putc(d)
      set_backlight(light)
      sleep_ms(ms)
      button(b)         # b can be :up, :left, :center, :right, :down 
      button_pressed(b) # b can be :up, :left, :center, :right, :down 
      buttons
      buttons_pressed
