local printer = peripheral.wrap("bottom")
 
function msg(gap, line, text) 
    printer.setCursorPos(gap,line)
    text = printer.write(text)
end 
 
if printer.newPage() then
    msg(01,02,"Griefing:")
    msg(01,03,"~~~~~~~~~")
    msg(01,04,"Griefing of any kind is  ")
    msg(01,05,"strictly prohibited.     ")
    msg(01,06,"Bypassing or overcoming  ")
    msg(01,07,"the security mechanics of")
    msg(01,08,"any kind and destroying  ")
    msg(01,09,"the property of a user is")
    msg(01,10,"also strictly prohibited ")
    msg(01,11,"and will be punished very")
    msg(01,12,"hard.")
    msg(01,13," ")
    msg(01,14,"No landscape destructive ")
    msg(01,15,"in the mainworld.        ")
    msg(01,16,"(1x1 towers ect.) ")
    msg(01,17,"Mining in the mainworld  ")
    msg(01,18,"(ores, spawner, wood...) ")
    msg(01,19,"is forbidden use /farm or")
    msg(01,20,"/quarry.")
    msg(19,21,"Page  4")
    printer.setPageTitle("Page 4")
    printer.endPage()
else
    error("Page could not be created.")
end