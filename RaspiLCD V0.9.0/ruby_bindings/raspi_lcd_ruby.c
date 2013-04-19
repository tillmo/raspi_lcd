/*
 * Ruby bindings for raspi-LCD
 */

#include <ruby.h>
/* include lcd controller with code, 
   since we want to include it in the library */
#include <../lcd.h>
#include <../lcd.c>


static VALUE r_LCD_ClearScreen(VALUE self)
{
  LCD_ClearScreen();
  return Qnil;
}
static VALUE r_LCD_SetPenColor(VALUE self, VALUE c)
{
  LCD_SetPenColor(FIX2INT(c));
  return Qnil;
}

static VALUE r_LCD_SetFillColor(VALUE self, VALUE c)
{
  LCD_SetFillColor(FIX2INT(c));
  return Qnil;
}

static VALUE r_LCD_SetFont(VALUE self, VALUE f)
{
  LCD_SetFont(FIX2INT(f));
  return Qnil;
}

static VALUE r_LCD_SetContrast(VALUE self, VALUE contrast)
{
  LCD_SetContrast(FIX2INT(contrast));
  return Qnil;
}


static VALUE r_LCD_PutPixel(VALUE self, VALUE x,VALUE y,VALUE color)
{
  LCD_PutPixel(FIX2INT(x),FIX2INT(y),FIX2INT(color));
  return Qnil;
}

static VALUE r_LCD_DrawLine(VALUE self, VALUE x0,VALUE y0,VALUE x1,VALUE y1)
{
  LCD_DrawLine(FIX2INT(x0),FIX2INT(y0),FIX2INT(x1),FIX2INT(y1));
  return Qnil;
}

static VALUE r_LCD_DrawCircle(VALUE self, VALUE x0,VALUE y0,VALUE radius)
{
  LCD_DrawCircle(FIX2INT(x0),FIX2INT(y0),FIX2INT(radius));
  return Qnil;
}

/* void LCD_DrawEllipse(int xm, int ym, int a, int b); */
static VALUE r_LCD_DrawEllipse(VALUE self, VALUE xm, VALUE ym, VALUE a, VALUE b)
{
  LCD_DrawEllipse(FIX2INT(xm),FIX2INT(ym),FIX2INT(a),FIX2INT(b));
  return Qnil;
}

static VALUE r_LCD_DrawRect(VALUE self, VALUE x0,VALUE y0,VALUE x1,VALUE y1,VALUE line)
{
  LCD_DrawRect(FIX2INT(x0),FIX2INT(y0),FIX2INT(x1),FIX2INT(y1),FIX2INT(line));
  return Qnil;
}

static VALUE r_LCD_PrintXY(VALUE self, VALUE x, VALUE y, VALUE s)
{
  char *p;

  VALUE str = StringValue(s);
  p = RSTRING_PTR(str);
  LCD_PrintXY(FIX2INT(x),FIX2INT(y),p);
  return Qnil;
}

/* void LCD_DrawBitmap(uint8 x0,uint8 y0,const uint8 *bmp); */
static VALUE r_LCD_DrawBitmap(VALUE self, VALUE x0,VALUE y0,VALUE bmp)
{
  uint8 *b;

  VALUE str = StringValue(bmp); /* fixme: does this work with uint8? */
  b = RSTRING_PTR(str);
  LCD_PrintXY(FIX2INT(x0),FIX2INT(y0),b);
  
  return Qnil;
}


static VALUE r_LCD_Init(VALUE self)
{
  LCD_Init;
  return Qnil;
}

static VALUE r_LCD_WriteFramebuffer(VALUE self)
{
  LCD_WriteFramebuffer();
  return Qnil;
}



/*
 * Module raspi_lcd_ruby
 */
VALUE m;
void Init_raspi_lcd_ruby() {
    m = rb_define_module("RaspiLCDRuby");
    rb_define_module_function(m,"LCD_ClearScreen",r_LCD_ClearScreen, 0);
    rb_define_module_function(m,"LCD_SetPenColor",r_LCD_SetPenColor, 1);
    rb_define_module_function(m,"LCD_SetFillColor",r_LCD_SetFillColor, 1);
    rb_define_module_function(m,"LCD_SetFont",r_LCD_SetFont, 1);
    rb_define_module_function(m,"LCD_SetContrast",r_LCD_SetContrast, 1);

    rb_define_module_function(m,"LCD_PutPixel",r_LCD_PutPixel, 3);
    rb_define_module_function(m,"LCD_DrawLine",r_LCD_DrawLine, 4);
    rb_define_module_function(m,"LCD_DrawCircle",r_LCD_DrawCircle, 3);
    rb_define_module_function(m,"LCD_DrawEllipse",r_LCD_DrawEllipse, 4);
    rb_define_module_function(m,"LCD_DrawRect",r_LCD_DrawRect, 5);
    rb_define_module_function(m,"LCD_PrintXY",r_LCD_PrintXY, 3);
    rb_define_module_function(m,"LCD_DrawBitmap",r_LCD_DrawBitmap, 3);

    rb_define_module_function(m,"LCD_Init",r_LCD_Init, 0);
    rb_define_module_function(m,"LCD_WriteFramebuffer",r_LCD_WriteFramebuffer, 0);
}

