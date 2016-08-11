
data:extend({

	{
    type = "mining-drill",
    name = "hydraulic-mining-drill",
    icon = "__Hydraulic_Mining_Drill__/graphics/icons/mining-drill/hydraulic-mining-drill.png",
    flags = {"placeable-neutral", "player-creation"},
    resource_categories = {"basic-solid"},
    minable = {mining_time = 1, result = "hydraulic-mining-drill"},
    max_health = 100,
    corpse = "medium-remnants",
    collision_box = {{ -0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{ -1, -1}, {1, 1}},
    mining_speed = 0.25,
	module_specification =
    {
      module_slots = 6,
      module_info_icon_shift = {0, 0.5},
      module_info_multi_row_initial_height_modifier = -0.3
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/burner-mining-drill.ogg",
        volume = 0.8
      },
    },
    energy_source =
    {
      type = "electric",
      -- will produce this much * energy pollution units per tick
      emissions = 1000 / 2.5,
      usage_priority = "primary-input"
    },
    energy_usage = "0.01kW",
    mining_power = 3,
    animations =
    {
	 north =
	 {
      filename = "__Hydraulic_Mining_Drill__/graphics/entity/mining_drill/north.png",
      priority = "high",
      width = 110,
      height = 76,
      frame_count = 32,
      line_length = 4,
      shift = {0.6875, -0.09375},
	  animation_speed = 0.5
	  },
	  east =
      {
        priority = "extra-high",
        width = 94,
        height = 74,
        line_length = 4,
        shift = {0.4375, -0.09375},
        filename = "__Hydraulic_Mining_Drill__/graphics/entity/mining_drill/east.png",
        frame_count = 32,
		animation_speed = 0.5
      },
      south =
      {
        priority = "extra-high",
        width = 89,
        height = 88,
        line_length = 4,
        shift = {0.40625, 0},
        filename = "__Hydraulic_Mining_Drill__/graphics/entity/mining_drill/south.png",
        frame_count = 32,
		animation_speed = 0.5
      },
      west =
      {
        priority = "extra-high",
        width = 91,
        height = 78,
        line_length = 4,
        shift = {0.09375, -0.0625},
        filename = "__Hydraulic_Mining_Drill__/graphics/entity/mining_drill/west.png",
        frame_count = 32,
		animation_speed = 0.5
      }
     },
    resource_searching_radius = 0.99,
    vector_to_place_result = {-0.5, -1.3},
    fast_replaceable_group = "mining-drill"
    },
	{
    type = "assembling-machine",
    name = "helper-tank",
    icon = "__Hydraulic_Mining_Drill__/graphics/nil.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "iron-plate"},
    max_health = 500,
	order = "a",
	selectable_in_game = false,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{ -1, -1}, {1, 1}},
    crafting_categories = {"hydraulic-mining"},
    --crafting_categories = {"crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1,
    ingredient_count = 2,
    module_specification =
    {
      --module_slots = 6,
      --module_info_icon_shift = {0, 0.5},
      --module_info_multi_row_initial_height_modifier = -0.3
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    corpse = "small-remnants",
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-0.5, 1.5} }}
      },
      --{
        --[[production_type = "output",
        --pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-0.5, -1.5} }}]]--
      --},
      off_when_no_fluid_recipe = false
    },
	--[[working_sound =
    {
      sound =
      {
        filename = "__base__/sound/burner-mining-drill.ogg",
        volume = 0
      },
    },--]]
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0
    },
    energy_usage = "0.01kW",
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    animation =
    {
	 north =
	 {
      filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
      priority = "high",
      width = 1000,
      height = 1000,
      frame_count = 1,
      --line_length = 4,
      --shift = {0.6875, -0.09375},
	  },
	  east =
      {
        priority = "extra-high",
        width = 1000,
        height = 1000,
       -- line_length = 4,
       -- shift = {0.4375, -0.09375},
        filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
        frame_count = 1,
      },
      south =
      {
        priority = "extra-high",
        width = 1000,
        height = 1000,
        --line_length = 4,
        --shift = {0.40625, 0},
        filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
       frame_count = 1,
      },
      west =
      {
        priority = "extra-high",
        width = 1000,
        height = 1000,
       -- line_length = 4,
        --shift = {0.09375, -0.0625},
        filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
        frame_count = 1,
      }
    }
    },
	{
    type = "electric-pole",
    name = "helper-pole",
    icon = "__Hydraulic_Mining_Drill__/graphics/nil.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "small-electric-pole"},
    max_health = 35,
	order = "a",
	selectable_in_game = false,
    corpse = "small-remnants",
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
    drawing_box = {{-0.1, -0.1}, {0.1, 0.1}},
    maximum_wire_distance = 0,
    supply_area_distance = 0.5,
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    pictures =
    {
      filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      direction_count = 1,
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.7, 0},
          red = {2.3, 0},
          green = {3.1, 0}
        },
        wire =
        {
          copper = {0, -2.7},
          red = {-0.4,-2.7},
          green = {0.4,-2.7}
        }
      },
    },
    radius_visualisation_picture =
    {
      filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
      width = 32,
      height = 32,
      priority = "extra-high-no-scale"
    }
    },
	{
    type = "generator",
    name = "helper-panel",
    icon = "__Hydraulic_Mining_Drill__/graphics/nil.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "steam-engine"},
    max_health = 300,
	selectable_in_game = false,
	order = "a",
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    effectivity = 1,
    fluid_usage_per_tick = 0.00001,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
	fluid_box = {
	  base_area = 100,
      pipe_connections =
      {
        { position = {0, -0.1} },
      },
	
	},
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.1, -0.1}, {0.1, 0.1}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
      width = 246,
      height = 137,
      frame_count = 1,
      line_length = 1,
    },
    vertical_animation =
    {
      filename = "__Hydraulic_Mining_Drill__/graphics/nil.png",
      width = 155,
      height = 186,
      frame_count = 1,
      line_length = 1,
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    min_perceived_performance = 0.25,
    }

})