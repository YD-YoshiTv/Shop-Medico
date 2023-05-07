ESX = exports["es_extended"]:getSharedObject()

-- MODELLO PED --
Citizen.CreateThread(function()
  if not HasModelLoaded('s_m_m_scientist_01') then
     RequestModel('s_m_m_scientist_01')
     while not HasModelLoaded('s_m_m_scientist_01') do
        Citizen.Wait(5)
     end
  end

npc = CreatePed(4, 's_m_m_scientist_01', 70.8774, -813.8076, 30.3313, 244.5249, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
end)

-- CODICE BLIP GRIDSYSTEM --
Citizen.CreateThread(function()
  for krs,shopmedico in pairs(Config.shopmedico) do
      TriggerEvent('gridsystem:registerMarker', {
          name = 'shopmedico'..shopmedico.x,
          pos = vector3(shopmedico.x, shopmedico.y, shopmedico.z),
          size = vector3(2.1,2.1,2.1),
          scale = vector3(0.4, 0.4, 0.4),
          color =  { r = 241, g = 101, b = 34 },
          drawDistance = 10.0,
          msg = '',
          control = 'E',
          type = 2,
          action = function()
            local input = lib.inputDialog('Parla con il medico', {
              {type = 'select', label = 'Che cure mediche vuoi comprare ?', options = {
                  {label = "💉 Medikit", value = "medikit"},
                  {label = "💊 Bende", value = "bandage"},
              }},
              {type = 'number', label = 'Number input', description = 'Some number description', icon = 'capsules'},
          })

            if input and #input > 0 then
              TriggerServerEvent('shopmedico', input[1], input[2])
            end

          end,
          onEnter = function()
            lib.showTextUI('[E] - Shop Medico', {
              position = "right-center",
              icon = 'syringe',
              style = {
                  borderRadius = 12,
                  backgroundColor = '#FF8C00',
                  color = 'white'
              }
          })
          end,
          onExit = function()
            lib.hideTextUI()
          end
      })
  end
  end)