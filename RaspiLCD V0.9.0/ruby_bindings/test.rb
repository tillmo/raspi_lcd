require 'raspi_lcd_ruby'

include RaspiLCDRuby
puts "1"
LCD_ClearScreen()
puts "2"
LCD_SetPenColor(1)
puts "3"
LCD_SetFillColor(1)
puts "4"
LCD_SetFont(1)
puts "5"
LCD_SetContrast(1)

puts "6"
LCD_PutPixel(1,1,2)
puts "7"
LCD_DrawLine(1,1,10,10)
puts "8"
LCD_DrawCircle(5,5,3)
puts "9"
LCD_DrawEllipse(2,3,3,4)
puts "10"
LCD_DrawRect(1,1,10,10,5)
puts "11"
LCD_PrintXY(3,3,"Hallo")
#LCD_DrawBitmap(3,3,bitmap)

puts "12"
LCD_Init()
#LCD_WriteFramebuffer()
