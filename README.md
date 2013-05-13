Ruby bindings for the raspberry pi LCD interface

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
      draw_bitmap(x,y,bmp)

      init()
      write_framebuffer()

      raspi_lcd_hw_init()
      update_buttons()
      get_raspberry_hw_revision()
      spi_putc(d)
      set_backlight(light)
      sleep_ms(ms)
