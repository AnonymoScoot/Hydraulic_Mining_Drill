

local minercurtime = 0
local minertime = 60

local panelcurtime = 0
local paneltime = 3600

function think()

	minercurtime = minercurtime + 1
	panelcurtime = panelcurtime + 1

	if paneltime < panelcurtime then
	
	if global.panel ~= nil then
			
		for k, v in pairs( global.panel ) do
				
			if v ~= nil then
				
				if v.fluidbox[1] ~= nil then
				
					local water = v.fluidbox[1]
					water.amount = 1000
					water.temperature = 100
					v.fluidbox[1] = water
				
				end
				
			end
			
		end
					
	end
	
	panelcurtime = 0
	
	end
	
	
	if minertime < minercurtime then
	
	if global.miner ~= nil then

		for k, miner in pairs (global.miner) do
		
			if miner ~= nil then
		
				if global.tank ~= nil then
				
					local v = global.tank[k]
						
					if v ~= nil then
				
						if v.is_crafting() then
						
							miner.active = true
			
						else
						
							miner.active = false
						
						end
			
					else
					
						miner.active = false
			
					end
					
				end
				
			end
					
		end	 
	
	end
	
	minercurtime = 0
	
	end
	
end

function destroy(event)
	
	if event.entity.name == "hydraulic-mining-drill" then
	
		for k, v in pairs({"helper-pole","helper-tank","helper-panel"}) do
		
			local X = event.entity.position.x 
			local Y = event.entity.position.y + 0.5	
			
			local miners = game.players[1].surface.find_entities_filtered{ area = {{X -0.5, Y - 0.5 }, {X + 0.5 , Y +0.5 }}, name = v }
			if miners[1] ~= nil then
			
				miners[1].destroy()	
			
			end
		
		end
		
		for k ,v in pairs(global.miner) do
		
			if event.entity == v then
		
				table.remove( global.miner, k )
				table.remove( global.tank, k )
				table.remove( global.panel, k )
				
			end
		
		end
	
	end

end

function place(event)

	global.miner = global.miner or {}
	global.tank = global.tank or {}
	global.panel = global.panel or {}
	
	local ent = event.created_entity
	
	local num = ( #global.miner + 1 )
	
	if ent.name == "hydraulic-mining-drill" then
		
		table.insert( global.miner, num, ent )
		
		ent.active = false
		
		for k, v in pairs({"helper-pole","helper-tank","helper-panel"}) do
		
			local e = ent
			local s = e.surface
			local X = e.position.x;
			local Y = e.position.y
			local l = s.create_entity{name = v, position = {X,Y}, force= game.forces.neutral}
			l.destructible = false
			
			if v == "helper-panel" then		
				
				l.fluidbox[1] = {type="water", amount=1000, temperature=100}
				
				table.insert( global.panel, num, l )
			
			end
			
			if v == "helper-tank" then
				
				l.recipe = "hydraulic-mining"
				l.direction = ent.direction
				
				table.insert( global.tank, num, l )
			
			end
		
		end

	end
	
end

function rotate(event)

	local ent = event.entity
	
	if ent.name == "hydraulic-mining-drill" then
			
			local X = event.entity.position.x 
			local Y = event.entity.position.y + 0.5	
			
			local miners = game.players[1].surface.find_entities_filtered{ area = {{X -0.5, Y - 0.5 }, {X + 0.5 , Y +0.5 }}, name = "helper-tank" }
			if miners[1] ~= nil then
			
				miners[1].direction = ent.direction	
			
			end
	
	end
	
end

script.on_event( defines.events.on_tick, think )
script.on_event( defines.events.on_built_entity, place )
script.on_event( defines.events.on_robot_built_entity, place )
script.on_event( defines.events.on_preplayer_mined_item , destroy )
script.on_event( defines.events.on_entity_died , destroy )
script.on_event( defines.events.on_robot_pre_mined , destroy )
script.on_event( defines.events.on_player_rotated_entity, rotate )

