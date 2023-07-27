WithHooker = false

function DrawText3Ds(coords, text, size, font)
    local coords = vector3(coords.x, coords.y, coords.z)

    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)

    if not size then size = 1 end

    if not font then font = 4 end

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)

    SetDrawOrigin(coords, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local blips = {
    -- {title="", colour=, id=, x=, y=, z=}

    {title="WOLF : Rent a Ped", colour=5, id=304, x = 111.8546, y = -1281.3542, z = 28.2607},
 }

      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function loadmodel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
    end
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function OpenUi(hookerSpawn, hookerWalk)
    hookerFirstSpawn = hookerSpawn
    hookerWalkTo = hookerWalk

    SetNuiFocus(true, true)

    SendReactMessage('setHomeVisible', {visible = true})
    SendReactMessage('setHookers', {hookers = Config.Hookers})
end

function GetDataFromHookId(id)
    for k,v in pairs(Config.Hookers) do 
        if v.id == id then
            return v
        end
    end
    return nil
end

function SpawnHooker(model)
    if WithHooker then
        return
    end
    
    SetNuiFocus(false, false)
    SendReactMessage('setHomeVisible', {visible = false})
    loadmodel(model)
    loaddict("mini@strip_club@idles@bouncer@base")

    hooker =  CreatePed(1, model, hookerFirstSpawn, true, true)
    -- FreezeEntityPosition(hooker, true)
    SetPedDefaultComponentVariation(hooker)
    SetPedComponentVariation(hooker, 8, 0, 0, 2)
    SetPedComponentVariation(hooker, 2, 0, 0, 2)
    SetPedAsGroupMember(hooker, playerGroup)
    SetPedComponentVariation(hooker, 8, 0, 0, 2)
    SetEntityInvincible(hooker, false)
    SetBlockingOfNonTemporaryEvents(hooker, true)
    local netEntity = NetworkGetNetworkIdFromEntity(hooker)

    Wait(1000)
    TaskGoToCoordAnyMeans(hooker, hookerWalkTo , 1.2, 0, 0, 786603, 1.0)
    Wait(30)
    DoScreenFadeOut(10)
    Wait(10)
    SetEntityCoords(PlayerPedId(),Config.BedPlayerCoords)
    SetEntityCoords(hooker,Config.HookerBedCoords)
    SetEntityHeading(hooker, Config.HookerBedCoords.w)
    ESX.ShowNotification('Wolf Agency : Your Ped Is On The Way, Please Wait Here')
    ClearPedTasks(hooker)
    Wait(3000)
    DoScreenFadeIn(1000)
    WithHooker = true
    SendReactMessage('setButtonVisible', {visible = false})
    local playerHeading = GetEntityHeading(PlayerPedId())
    TaskFollowToOffsetOfEntity(hooker, PlayerPedId(), 0.6, 0.6, 0.0, 1.0, 0.1, 0.1, true)

    while WithHooker do
        Citizen.Wait(0)
        if IsEntityDead(hooker) then
            ESX.ShowNotification('Wolf Agency : The Ped Is Removed')
            StopAnimation(hooker)
            WithHooker = false
        end
    end
end

function PlayAnim(Ped, Dict, Anim, Flag)
    loaddict(Dict)
    TaskPlayAnim(Ped, Dict, Anim, 8.0, -8.0, -1, Flag or 0, 0, false, false, false)
end

function StopAnimation(puta)
    DetachEntity(puta)
    ClearPedTasks(PlayerPedId())
    DoScreenFadeOut(1000)
    DeleteEntity(puta)
    Wait(1000)
    DoScreenFadeIn(1000)
    SendReactMessage('setButtonVisible', {visible = false})
    WithHooker = false
end

function OpenAnimationMenu()
    SetNuiFocus(true, true)
    SendReactMessage('setMenuVisible', {visible = true})
    -- setAnimations
    SendReactMessage('setAnimations', {animations = Config['Synced']})
end


function ExecuteAnimation(HookerPed, animationId)
    ClearPedTasks(PlayerPedId())
    ClearPedTasks(HookerPed)
    DetachEntity(HookerPed)
    local id = tonumber(animationId)
    local anim = Config['Synced'][id]
    local type = 'Requester'
    local target = HookerPed
    if anim['Alone'] then 
        PlayAnim(target, anim['Dict'], anim['Anim'], 1)
        return
    end
    -- print(anim['Attach'])

    if anim['Attach'] == nil then
        local attache = anim['Requester']['Attach']
        AttachEntityToEntity(target, PlayerPedId(), attache['Bone'], attache['xP'], attache['yP'], attache['zP'], attache['xR'], attache['yR'], attache['zR'], 0, 0, 0, 0, 2, 1)
    end

    Wait(750)

    if anim['Accepter']['Type'] == 'animation' then
        PlayAnim(PlayerPedId(), anim['Accepter']['Dict'], anim['Accepter']['Anim'], anim['Accepter']['Flags'])
        PlayAnim(target, anim['Requester']['Dict'], anim['Requester']['Anim'], anim['Requester']['Flags'])
    end

    if type == 'Requester' then
        anim = Config['Synced'][id]['Accepter']
    else
        anim = Config['Synced'][id]['Requester']
    end
    while not IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
        Wait(0)
        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    end
    DetachEntity(target)
    while IsEntityPlayingAnim(target, anim['Dict'], anim['Anim'], 3) do
        Wait(0)
        SetEntityNoCollisionEntity(PlayerPedId(), target, true)
    end

    ClearPedTasks(PlayerPedId())
end

RegisterCommand('OpenAnimationHookMenu', function()
    if WithHooker then 
     OpenAnimationMenu()
    end
end)

RegisterKeyMapping('OpenAnimationHookMenu', 'Show Animations', 'keyboard', 'F7')

RegisterKeyMapping('finish_hooker_time', 'Finish Hooker Time', 'keyboard', '`')

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustPressed(0, 243) and not IsPlayerDead(PlayerId()) then -- check if 'f' key is pressed and player is not dead
            if WithHooker then
                DetachEntity(hooker, true, false) -- detach hooker from player
                ClearPedTasksImmediately(hooker) -- clear hooker's tasks
                StopAnimTask(PlayerPedId()) -- clear player's tasks
                TaskFollowToOffsetOfEntity(hooker, PlayerPedId(), 0.6, 0.6, 0.0, 1.0, 0.1, 0.1, true)
                SetEntityInvincible(hooker, false)
            end
        end
    end
end)

RegisterCommand('FinishHookerTime', function()
    if WithHooker then 
        StopAnimation(hooker)
    end
end)

RegisterCommand('stoptheped', function()
    TaskFollowToOffsetOfEntity(hooker, PlayerPedId(), 0.6, 0.6, 0.0, 1.0, 0.1, 0.1, false)
end)

RegisterKeyMapping('FinishHookerTime', 'Finish Hook Time', 'keyboard', 'F9')

