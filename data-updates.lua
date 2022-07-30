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
