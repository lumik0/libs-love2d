-- ЭТО МОЯ БИБЛИОТЕКА -- THIS IS MY LIB -- by Lumik

local a = {this_alerts = {}}

a.new = function(id,text, textbutton)
    table.insert(a.this_alerts, {
        id = id,
        text1 = text,
        textbutton = textbutton or nil
    })
end
a.remove = function(id)
    table.remove(a.this_alerts, a.findAlert(id))
end
a.findAlert = function(id)
    for i = 1, #a.this_alerts do
        if a.this_alerts[i].id == id then
            return i
        end
    end
end

a.draw = function()
    for i = 1, #a.this_alerts do
        love.graphics.setColor(0.10,0.10,0.10)

        love.graphics.rectangle("fill",_x/2, _y/2, _w/2, _h/2)
        love.graphics.setColor(1,1,1)

        love.graphics.print(a.this_alerts[i].text1, _x/2+20, _y/2+20)

        --love.graphics.setColor(1,1,1)
    end
end

return a
