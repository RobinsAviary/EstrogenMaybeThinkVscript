local objectiveResource = Entities.FindByClassname(null, "tf_objective_resource")

local activated = false
local tickSpeed = 0.1

local percentageReset = false

function estrothink() {
    local cappingTeam = NetProps.GetPropIntArray(objectiveResource, "m_iCappingTeam", 2)

    if (cappingTeam == 2 || cappingTeam == 3) {
        local capPercentage = NetProps.GetPropFloatArray(objectiveResource, "m_flCapPercentages", 2)

        EntFire("estrogenMaybe", "SetPosition", (1 - capPercentage).tostring()) // Update target position for func_movelinear. Thankfully interpolation is free.

        //printl(capPercentage.tostring())

        percentageReset = false
    } else if (!percentageReset) {
        EntFire("estrogenMaybe", "SetPosition", "0")
        percentageReset = true
    }

    return tickSpeed
}