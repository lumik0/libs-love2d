-- THIS IS MY LIB -- ЭТО МОЯ БИБЛИОТЕКА -- by Lumik

local a = {}
a.this_buttons = {}
--local color = {0.15,0.15,0.15}

a.newButton = function(id,text,work,x,y,width,height,color,colorclicked,func)
   table.insert(a.this_buttons, {
      id = id,
      work = work, 
      text =text,
      x=x,
      y=y,
      textx=x+10,
      texty=y+10,
      height=height,
      width=width,
      func=func,
      clicked=false,
      color=color or {0.15,0.15,0.15},
      colorClicked =colorclicked or {0.14,0.14,0.14},
      colorA = color or {0.15,0.15,0.15}
   })
end
a.removeButton = function(index)
   a.this_buttons[index].work = false
   --a.this_buttons[index].text = ''
   --a.this_buttons[index].id = id
   --a.this_buttons[index].x = 0
   --a.this_buttons[index].y = 0
   --a.this_buttons[index].width = 0
   --a.this_buttons[index].height = 0
end
a.removeAllButtons = function()
   a.this_buttons = {}
end
a.findButton = function(id)
   for i = 1, #a.this_buttons do
      if a.this_buttons[i].id == id then
         return i
      end
   end
end
a.drawButton = function(i)
   if a.this_buttons then
      if a.this_buttons[i].work then
         love.graphics.setColor(a.this_buttons[i].colorA)--(0.15,0.15,0.15)--
         love.graphics.rectangle("fill", a.this_buttons[i].x,a.this_buttons[i].y,a.this_buttons[i].width,a.this_buttons[i].height)
         love.graphics.setColor(1,1,1)
         love.graphics.print(a.this_buttons[i].text, a.this_buttons[i].textx, a.this_buttons[i].texty)
      end

      --local hot = mouseX > a.this_buttons[i].x and mouseX < a.this_buttons[i].x + this_buttons[i].width and
      --            mouseY > a.this_buttons[i].y and mouseY < a.this_buttons[i].y + this_buttons[i].height
      if a.this_buttons[i].clicked and a.this_buttons[i].work then
         a.this_buttons[i].colorA = a.this_buttons[i].colorClicked
      else
         a.this_buttons[i].colorA = a.this_buttons[i].color
      end
   end
end
a.drawAllButtons = function()
   if a.this_buttons then
      for i = 1, #a.this_buttons do
         if a.this_buttons[i].work then
            love.graphics.setColor(a.this_buttons[i].colorA)
            love.graphics.rectangle("fill", a.this_buttons[i].x,a.this_buttons[i].y,a.this_buttons[i].width,a.this_buttons[i].height)
            love.graphics.setColor(1,1,1)
            love.graphics.print(a.this_buttons[i].text, a.this_buttons[i].textx, a.this_buttons[i].texty)
         end

         --local hot = mouseX > a.this_buttons[i].x and mouseX < a.this_buttons[i].x + this_buttons[i].width and
         --            mouseY > a.this_buttons[i].y and mouseY < a.this_buttons[i].y + this_buttons[i].height
         if a.this_buttons[i].clicked and a.this_buttons[i].work then
            a.this_buttons[i].colorA = a.this_buttons[i].colorClicked
         else
            a.this_buttons[i].colorA = a.this_buttons[i].color
         end
      end
   end
end
a.checkPressed = function(self, mouse_x, mouse_y, cursor_radius)
   if a.this_buttons then
      if (mouse_x + cursor_radius >= a.this_buttons[self].x) and (mouse_x - cursor_radius <= a.this_buttons[self].x + a.this_buttons[self].width) then
         if (mouse_y + cursor_radius >= a.this_buttons[self].y) and (mouse_y - cursor_radius <= a.this_buttons[self].y + a.this_buttons[self].height) then
            if a.this_buttons[self].work == true then
               --a.this_buttons[self].clicked = true
               a.this_buttons[self].func()
               --love.timer.sleep(0.5)
               --a.this_buttons[self].clicked = false
               --a.this_buttons[self].colorClicked = s
               --love.timer.sleep(0.1)
            end
         end
      end
   end
end
a.CheckMouse = function (self,mouse_x,mouse_y, cursor_radius)
   if a.this_buttons then
      if a.this_buttons[self].work == true then
         if (mouse_x + cursor_radius >= a.this_buttons[self].x) and (mouse_x - cursor_radius <= a.this_buttons[self].x + a.this_buttons[self].width) and
            (mouse_y + cursor_radius >= a.this_buttons[self].y) and (mouse_y - cursor_radius <= a.this_buttons[self].y + a.this_buttons[self].height) then
            a.this_buttons[self].clicked = true
         else
            a.this_buttons[self].clicked = false
         end
      end
   end
end

return a
