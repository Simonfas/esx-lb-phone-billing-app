ESX = exports["es_extended"]:getSharedObject()

local identifier = "billing-app"

local function AddApp()
    local added, errorMessage = exports["lb-phone"]:AddCustomApp({
        identifier = identifier,
        name = Config.name,
        description = Config.description,
        developer = Config.developer or "Simonfas",
        defaultApp = Config.defaultApp,
        size = Config.size,
        price = Config.price,
        images = Config.images,
        ui = GetCurrentResourceName() .. "/ui/billing.html",
        icon = Config.icon
    })

    if Config.debug then
        if added then
            print("[billing-app] App successfully added.")
        else
            print("[billing-app] Could not add app: " .. tostring(errorMessage))
        end
    end
end

CreateThread(function()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)
end)

RegisterNUICallback("getBills", function(_, cb)
    ESX.TriggerServerCallback("esx_billing:getBills", function(bills)
        cb(bills or {})
    end)
end)

RegisterNUICallback("payBill", function(data, cb)
    local billId = tonumber(data.billId)

    if not billId then
        cb({
            success = false,
            message = "Ugyldigt regnings-ID."
        })
        return
    end

    ESX.TriggerServerCallback("esx_billing:payBill", function(success)
        if success then
            exports["lb-phone"]:SendNotification({
                app = identifier,
                title = "Regning betalt",
                content = "Din regning blev betalt."
            })

            cb({
                success = true,
                message = "Regningen blev betalt."
            })
        else
            exports["lb-phone"]:SendNotification({
                app = identifier,
                title = "Betaling fejlede",
                content = "Du kunne ikke betale regningen."
            })

            cb({
                success = false,
                message = "Kunne ikke betale regningen."
            })
        end
    end, billId)
end)
