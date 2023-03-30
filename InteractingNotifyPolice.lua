-- Replace "TeamValueName" with the name of the value on the player that determines their team

local TEAM_VALUE_NAME = "TeamValueName"

-- Get the object to monitor for interactions

local object = script.Parent

-- Get the parent of the object that contains the value you want to check

local objectParent = object.Parent

if not objectParent then

    error("Object parent not found!")

end

-- Function to notify the police team

local function notifyPolice(player)

    local policeTeam = game.Teams.PoliceTeam

    -- Notify all players on the police team that a player interacted with the object

    for _, teamMember in ipairs(policeTeam:GetPlayers()) do

        if teamMember ~= player then

            game.ReplicatedStorage.NotifyPlayer:FireClient(teamMember, player.Name .. " interacted with the object!")

        end

    end

end

-- Function to handle player interactions with the object

local function handleInteraction(part)

    local player = game.Players:GetPlayerFromCharacter(part.Parent)

    if not player then

        return

    end

    -- Check if the player is on the police team

    local teamValue = player:FindFirstChild(TEAM_VALUE_NAME)

    if not teamValue or teamValue.Value ~= "Police" then

        -- Notify the police team of the interaction

        notifyPolice(player)

    end

end

-- Connect the handleInteraction function to the Touched event of the object

object.Touched:Connect(handleInteraction)

