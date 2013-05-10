require 'test/unit'
require 'raspi_lcd'
include RaspiLCD

class RaspiLCDTest < Test::Unit::TestCase
  def test_clear_screen
    assert_equal nil,  
      clear_screen()
  end
  def test_set_pen_colot
    assert_equal nil,  
      set_pen_color(1)
  end
  def test_set_fill_color
    assert_equal nil,  
      set_fill_color(1)
  end
  def test_set_font
    assert_equal nil,  
      set_font(1)
  end
  def test_put_pixel
    assert_equal nil,  
      put_pixel(1,1,2)
  end
  def test_draw_line
    assert_equal nil,  
      draw_line(1,1,10,10)
  end
  def test_draw_circle
    assert_equal nil,  
      draw_circle(5,5,3)
  end
  def test_draw_ellipse
    assert_equal nil,  
      draw_ellipse(2,3,3,4)
  end
  def test_draw_rect
    assert_equal nil,  
      draw_rect(1,1,10,10,5)
  end
  def test_print_xy
    assert_equal nil,
      RaspiLCD.print_xy(0,0,"hello world")
  end
  def test_draw_bitmap
    assert_equal nil,  
      draw_bitmap(3,3,"wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww")
  end
  def test_init
    assert_equal nil,  
      init()
  end
end

