-- Recipe overrides
-- ================

local recipe_overrides = {

    -- Nuclear Locomotives
    ['nuclear-locomotive'] = {
        ingredients = {
            {"nuclear-reactor", 1},
            {"heat-pipe", 5},
            {"electric-engine-unit", 20},
            {"advanced-circuit", 10},
            {"low-density-structure", 20},
        },
    }

}

for recipe, overrides in pairs(recipe_overrides) do
    if data.raw.recipe[recipe] then
        data.raw.recipe[recipe].ingredients = overrides.ingredients
    end
end


-- Control overrides
-- =================

local control_overrides = {
    ['Shortcuts-ick'] = {
        -- Vehicle Wagon 2 winch (for loading vehicles onto the wagon).
        { name = "winch", key_sequence = "ALT + W", alternative_key_sequence = "" }
    }
}

-- Piggy-back off of the base mod setting.
if settings.startup["beyond-vanilla-qol-enable-modpack-controls-configuration"] then
    for mod, controls in pairs(control_overrides) do
        for _, control in ipairs(controls) do
            if data.raw["custom-input"][control.name] then
                data.raw["custom-input"][control.name].key_sequence = control.key_sequence
                data.raw["custom-input"][control.name].alternative_key_sequence = control.alternative_key_sequence
            else
                print("[ERROR] (beyond-vanilla-qol-plus) Unknown control, skipping: " .. mod .. "/" .. control.name)
            end
        end
    end
end
