-- support for i18n
local S = minetest.get_translator("ferns")
-----------------------------------------------------------------------------------------------
-- Ferns - Crafting 0.0.5
-----------------------------------------------------------------------------------------------
-- (by Mossmanikin)
-----------------------------------------------------------------------------------------------

local fern1 = minetest.registered_items["default:fern_1"] or false
fern1 = (fern1 and fern1.name) or "ferns:fern_01"


minetest.register_craft({
	type = "shapeless",
	output = "ferns:fiddlehead 3",
	recipe = { "ferns:fern_01" },
	replacements = {
		{ fern1, "ferns:ferntuber" }
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "ferns:fiddlehead 3",
	recipe = { "ferns:tree_fern_leaves" },
	replacements = {
		{ "ferns:tree_fern_leaves", "ferns:sapling_tree_fern" }
	},
})
-----------------------------------------------------------------------------------------------
-- FIDDLEHEAD
-----------------------------------------------------------------------------------------------
minetest.register_alias("archaeplantae:fiddlehead", "ferns:fiddlehead")

minetest.register_craftitem("ferns:fiddlehead", {
	description = S("Fiddlehead") .. '\n' ..
		minetest.colorize('#DEB887', S('Hunger') .. ': -1'),
	inventory_image = "ferns_fiddlehead.png",
	on_use = function(itemstack, user, pointed_thing)
		local hunger_amount = minetest.get_item_group(itemstack:get_name(), "hunger_amount") or 0
		if hunger_amount == 0 then
			return itemstack
		end
		return minetest.item_eat(hunger_amount)(itemstack, user, pointed_thing)
	end, -- slightly poisonous when raw
	groups = {
		hunger_amount = -1
	}
})
minetest.register_craft({
	type = "cooking",
	output = "ferns:fiddlehead_roasted",
	recipe = "ferns:fiddlehead",
	cooktime = 1,
})
minetest.register_craftitem("ferns:fiddlehead_roasted", {
	description = S("Roasted Fiddlehead") .. '\n' ..
		minetest.colorize('#DEB887', S('Hunger') .. ': 1'),
	inventory_image = "ferns_fiddlehead_roasted.png",
	on_use = function(itemstack, user, pointed_thing)
		local hunger_amount = minetest.get_item_group(itemstack:get_name(), "hunger_amount") or 0
		if hunger_amount == 0 then
			return itemstack
		end
		return minetest.item_eat(hunger_amount)(itemstack, user, pointed_thing)
	end,
	groups = {
		hunger_amount = 1
	}
})
-----------------------------------------------------------------------------------------------
-- FERN TUBER
-----------------------------------------------------------------------------------------------
minetest.register_alias("archaeplantae:ferntuber", "ferns:ferntuber")

minetest.register_craftitem("ferns:ferntuber", {
	description = S("Fern Tuber"),
	inventory_image = "ferns_ferntuber.png",
})
minetest.register_craft({
	type = "cooking",
	output = "ferns:ferntuber_roasted",
	recipe = "ferns:ferntuber",
	cooktime = 3,
})

minetest.register_alias("archaeplantae:ferntuber_roasted", "ferns:ferntuber_roasted")

minetest.register_craftitem("ferns:ferntuber_roasted", {
	description = S("Roasted Fern Tuber") .. '\n' ..
		minetest.colorize('#DEB887', S('Hunger') .. ': 3'),
	inventory_image = "ferns_ferntuber_roasted.png",
	on_use = function(itemstack, user, pointed_thing)
		local hunger_amount = minetest.get_item_group(itemstack:get_name(), "hunger_amount") or 0
		if hunger_amount == 0 then
			return itemstack
		end
		return minetest.item_eat(hunger_amount)(itemstack, user, pointed_thing)
	end,
	groups = {
		hunger_amount = 3
	}
})
-----------------------------------------------------------------------------------------------
-- HORSETAIL  (EQUISETUM) --> GREEN DYE https://en.wikipedia.org/wiki/Equisetum
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = "shapeless",
	output = "dye:green",
	recipe = { "group:horsetail" },
})
-----------------------------------------------------------------------------------------------
-- GLUE WOODEN TOOLS with RESIN & POLISH them with HORSETAIL (planned)
-----------------------------------------------------------------------------------------------
--[[minetest.register_craft({
	type = "shapeless",
	output = "default:pick_wood",
	recipe = {"default:pick_wood","group:horsetail","farming:string","default:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "default:shovel_wood",
	recipe = {"default:shovel_wood","group:horsetail","farming:string","default:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "default:axe_wood",
	recipe = {"default:axe_wood","group:horsetail","farming:string","default:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "default:sword_wood",
	recipe = {"default:sword_wood","group:horsetail","farming:string","default:stick"},
})
minetest.register_craft({
	type = "shapeless",
	output = "farming:hoe_wood",
	recipe = {"farming:hoe_wood","group:horsetail","farming:string","default:stick"},
})]]
