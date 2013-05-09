require 'test/unit'
require 'raspi_lcd'
include RaspiLCD

class RaspiLCDTest < Test::Unit::TestCase
  def test_printXY
    assert_equal nil,
      RaspiLCD.print_xy(0,0,"hello world");
  end
end