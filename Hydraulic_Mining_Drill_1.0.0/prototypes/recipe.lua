
data:extend({

	{
    type = "recipe",
    name = "hydraulic-mining",
	category = "hydraulic-mining",
    enabled = true,
    hidden = true,
	subgroup = "extraction-machine",
    energy_required = 0.016,
    ingredients =
    {
	  {type="fluid", name="water", amount=0.25}
    },
    results = 
    {
      {name="iron-plate", amount=1, probability = 0}
    },
    icon = "__Hydraulic_Mining_Drill__/graphics/icons/mining-drill/hydraulic-mining-drill.png",
    order = "b"
    },
	{
    type = "recipe",
    name = "hydraulic-mining-drill",
	subgroup = "extraction-machine",
    energy_required = 2,
	enabled = true,
    ingredients =
    {
      {"iron-gear-wheel", 2},
	  {"iron-plate", 3},
	  {"copper-cable", 4},
      {"pipe", 4}
    },
    result = "hydraulic-mining-drill",
	icon = "__Hydraulic_Mining_Drill__/graphics/icons/mining-drill/hydraulic-mining-drill.png",
    order = "b"
   }



})