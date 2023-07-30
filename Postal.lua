 
local portalCenter = {774, 39, 801}
 
local particles = {
    {"minecraft:cloud",300},
    {"mekanism:jetpack",100},
    {"minecraft:sonic_boom",50},
}
 
local function summonEffect(effect,radius,speed,count)
    local pos = portalCenter[1]-(radius[1]/2).." "..portalCenter[2].." "..portalCenter[3]
    local delta = radius[1].." "..radius[2].." "..radius[3]
    local cmd = "particle "..effect.." "..pos.." "..delta.." "..speed.." "..count
    -- print(cmd)
    local result,err =exec(cmd)
    -- print(result)
    if not result then
        print(err)
    end
end
 
local function openNether()
    exec("setblock 776 33 795 minecraft:fire")
end
 
local function closeNether()
    exec("setblock 776 33 795 minecraft:air")
end
 
local function startPortalSquence()
    for i = 1, 10, 1 do
        for index, value in ipairs(particles) do
            summonEffect(value[1],{i,3,3},0.05,value[2])
            sleep(0.01)
        end
    end
    openNether()
end
 
local modem = peripheral.wrap("top")
modem.open(4)  -- Open channel 3 so that we can listen on it
 
while true do
    local event, mSide, SrcCh, 
      repCh, msg, dist = os.pullEvent("modem_message")
    print("msg:"..msg)
    if(msg == "open") then
        startPortalSquence()
    elseif msg == "close" then
        closeNether()
    end
end
 
 