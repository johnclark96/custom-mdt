QBCore = nil
customMdt = {}
inMdt = false
inVehicleWithMdt = false

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerJob = PlayerData.job
    PlayerName = PlayerData.name
    isLoggedIn = true
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

customMdt.Open = function()
    SendNuiMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
    inMdt = true
end

customMdt.Close = function()
    SendNuiMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
    inMdt = false
end