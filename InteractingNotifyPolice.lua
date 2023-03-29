-- Replace "ObjectName" with the name of the object you want to track

local object = game.Workspace:WaitForChild("ObjectName")

-- Replace "PoliceTeam" with the name of the team you want to notify

local policeTeam = game.Teams:FindFirstChild("PoliceTeam")

object.Touched:Connect(function(hit)
-- Source By MITUMA X HUB

    local player = game.Players:GetPlayerFromCharacter(hit.Parent)

    if player and policeTeam then

        local message = "Player " .. player.Name .. " interacted with " .. object.Name

        local notification = Instance.new("Hint", policeTeam.TeamColor)

        notification.Text = message

        wait(5)

        notification:Destroy()

    end

end)

