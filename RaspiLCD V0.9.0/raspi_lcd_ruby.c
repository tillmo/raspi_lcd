/*
 * Ruby bindings for rapsi-LCD
 */

#include <ruby.h>
#include <lcd.h>


static VALUE r_LCD_PrintXY(VALUE self, VALUE x, VALUE y, VALUE s)
{
  VALUE str = StringValue(s);
  p = RSTRING_PTR(str);
  LCD_PrintXY(FIX2INT(x),FIX2INT(y),p)
  return Qnil
}


/*
 * Module raspi_lcd_ruby
 */
VALUE m_raspi_lcd_ruby;
void Init_raspi_lcd_rubyt() {
    m_raspi_lcd_ruby = rb_define_module("raspi_lcd_ruby");
    rb_define_module_function(m_raspi_lcd_ruby, 
                              "LCD_PrintXY",
                              r_LCD_PrintXY, 3);

}
