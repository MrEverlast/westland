AddEvent("OnPackageStart", function()
    teamUI = CreateWebUI(0, 0, 0, 0, 0, 60)
	LoadWebFile(teamUI, "http://asset/westland_gamemode/gui/team/team.html")
	SetWebAlignment(teamUI, 0.0, 0.0)
	SetWebAnchors(teamUI, 0.0, 0.0, 1.0, 1.0)
    SetWebVisibility(teamUI, WEB_VISIBLE)
	SetInputMode(INPUT_GAMEANDUI)
    ShowMouseCursor(true)
end)

function OnResolutionChange(width, height)
    AddPlayerChat("Resolution changed to "..width.."x"..height)
    SetWebSize(teamUI, width, height)
end
AddEvent("OnResolutionChange", OnResolutionChange)


function SetWestlandTeam(team)
    CallRemoteEvent("SetPlayerWestlandTeam", tostring(team))
    SetWebVisibility(teamUI, WEB_HIDDEN)
    ShowMouseCursor(false)
    SetInputMode(INPUT_GAME)
    DestroyWebUI(teamUI)
end
AddEvent("SetWestlandTeam", SetWestlandTeam)