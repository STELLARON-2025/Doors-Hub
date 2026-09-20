local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local TARGET_PLACE_IDS = {
	[6516141723] = true, -- --- Сюда можно добавить PlaceId других этажей Doors, если нужно
}

if TARGET_PLACE_IDS[game.PlaceId] then
	if not LocalPlayer.Character then
		LocalPlayer.CharacterAdded:Wait()
	end
	
	local uiModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/STELLARON-2025/Doors-Hub/refs/heads/main/Doors_Hub/ui/main_ui.luau"))() --- Внутри кавычек нужно будет указать RAW-ссылку на main_ui.luau из GitHub
	uiModule.Create()
end
