-- THIS IS MY LIB -- ЭТО МОЯ БИБЛИОТЕКА -- by Lumik

local a = {}
a.this_inputs = {}
a.p = false
a.pid = 0
local color = {1,1,1}

a.newInput = function(id,text,work,x,y,width,height,func)
    table.insert(a.this_inputs, {id = id,work = work, text =text,x=x,y=y,height=height,width=width,func=func,clicked=false, value = ''})
end
a.removeInput = function(i)
    a.this_inputs[i].work = false
end
a.removeAllInputs = function()
    a.this_inputs = {}
end
a.findInput = function(id)
    for i = 1, #a.this_inputs do
        if a.this_inputs[i].id == id then
            return i
        end
    end
end
a.drawInput = function(i)
    if a.this_inputs then
        if a.this_inputs[i].work then
            love.graphics.setColor(color)
            love.graphics.rectangle("fill", a.this_inputs[i].x,a.this_inputs[i].y,a.this_inputs[i].width,a.this_inputs[i].height)
            love.graphics.setColor(0,0,0)
            love.graphics.print(a.this_inputs[i].value, a.this_inputs[i].x + 10, a.this_inputs[i].y + 10)
        end
 
        --local hot = mouseX > a.this_buttons[i].x and mouseX < a.this_buttons[i].x + this_buttons[i].width and
        --            mouseY > a.this_buttons[i].y and mouseY < a.this_buttons[i].y + this_buttons[i].height
        if a.this_inputs[i].clicked and a.this_inputs[i].work then
            color = {0.20,0.20,0.20}
        end
    end
end
a.checkPressed = function(self, mouse_x, mouse_y, cursor_radius)
    if a.this_inputs then
        if (mouse_x + cursor_radius >= a.this_inputs[self].x) and (mouse_x - cursor_radius <= a.this_inputs[self].x + a.this_inputs[self].width) and
           (mouse_y + cursor_radius >= a.this_inputs[self].y) and (mouse_y - cursor_radius <= a.this_inputs[self].y + a.this_inputs[self].height) then
            if a.this_inputs[self].work == true then
                a.p = true
                a.pid = a.this_inputs[self].id
                a.this_inputs[self].func()
            end
        else
            a.p = false
        end
    end
end
a.Key = function(k)
    if a.p then
        if k == 'backspace' then
            local t = string.len(a.this_inputs[a.findInput(a.pid)].value)
            a.this_inputs[a.findInput(a.pid)].value = string.sub(a.this_inputs[a.findInput(a.pid)].value, 1,t-1)
        end
        if k == 'space' then
            a.this_inputs[a.findInput(a.pid)].value = a.this_inputs[a.findInput(a.pid)].value .. ' '
        end
        if k ~= 'backspace' and k ~='capslock' and k ~= 'return' and k ~= 'space' and k ~= 'tab' and
            k ~= 'f1' and k ~= 'f2' and k ~= 'f3' and k ~= 'f4' and k ~= 'f5' and k ~= 'f6' and
            k ~= 'f7' and k ~= 'f8' and k ~= 'f9' and k ~= 'f10' and k ~= 'f11' and k ~= 'f12' and
            k ~= 'win' and k ~= 'ctrl' and k ~= 'home' and k ~= 'delete'  and k ~= 'end' and k ~= 'insert' and
            k ~= 'pageup' and k ~= 'pagedown' and k ~= 'f13' and k ~= 'f14' and k ~= 'f15' and k ~= 'right' and
            k ~= 'left' and k ~= 'up' and k ~= 'down' 
            then
            a.this_inputs[a.findInput(a.pid)].value = a.this_inputs[a.findInput(a.pid)].value .. k
        end
    end
end


return a
