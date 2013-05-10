require 'test/unit'
require 'raspi_lcd'
include RaspiLCD

# this can be only tested on the raspberry pi itself!

class OnRaspiTest < Test::Unit::TestCase
  def test_set_contrast
    assert_equal nil,  
      set_contrast(1)
  end
  def test_write_framebuffer
    assert_equal nil,  
      write_framebuffer()
  end      
end
