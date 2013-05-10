/*
 * Ruby bindings for raspi-LCD
 */

#include <ruby.h>
/* include lcd controller with code, 
   since we want to include it in the library */
#include <../RaspiLCD-V0.9.0/lcd.h>
#include <../RaspiLCD-V0.9.0/lcd.c>
#include <../RaspiLCD-V0.9.0/bcm2835.h>
#include <../RaspiLCD-V0.9.0/bcm2835.c>


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
 * Module raspi_lcd
 */
VALUE m;
void Init_raspi_lcd() {
    m = rb_define_module("RaspiLCD");
    rb_define_module_function(m,"clear_screen",r_LCD_ClearScreen, 0);
    rb_define_module_function(m,"set_pen_color",r_LCD_SetPenColor, 1);
    rb_define_module_function(m,"set_fill_color",r_LCD_SetFillColor, 1);
    rb_define_module_function(m,"set_font",r_LCD_SetFont, 1);
    rb_define_module_function(m,"set_contrast",r_LCD_SetContrast, 1);

    rb_define_module_function(m,"put_pixel",r_LCD_PutPixel, 3);
    rb_define_module_function(m,"draw_line",r_LCD_DrawLine, 4);
    rb_define_module_function(m,"draw_circle",r_LCD_DrawCircle, 3);
    rb_define_module_function(m,"draw_ellipse",r_LCD_DrawEllipse, 4);
    rb_define_module_function(m,"draw_rect",r_LCD_DrawRect, 5);
    rb_define_module_function(m,"print_xy",r_LCD_PrintXY, 3);
    rb_define_module_function(m,"draw_bitmap",r_LCD_DrawBitmap, 3);

    rb_define_module_function(m,"init",r_LCD_Init, 0);
    rb_define_module_function(m,"write_framebuffer",r_LCD_WriteFramebuffer, 0);
}

