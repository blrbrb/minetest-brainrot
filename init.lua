-- Setup
dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/jumpscare.lua")
local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)


local function load_mobs(subdir)
    local dir_path = modpath .. "/" .. subdir
    local files = minetest.get_dir_list(dir_path, false)

    if not files then
        minetest.log("error", "Failed to read directory: " .. dir_path)
        return
    end

    for _, file in ipairs(files) do
        if file:sub(-4) == ".lua" then
            local file_path = dir_path .. "/" .. file
            dofile(file_path)
        end
    end
end

-- Call the function to load Lua files
load_mobs("mobs")

minetest.register_on_joinplayer(function(player)
    -- Ensure the player object is valid before proceeding
    if player then
        -- Get the player's name to uniquely identify HUD elements
        local player_name = player:get_player_name()

        -- Clear the player's existing HUD elements (optional, depending on your needs)
        player:hud_set_hotbar_image("")
        player:hud_set_hotbar_selected_image("")

        -- Set the custom heart texture
        local heart_texture = "brainrot_hud_slobber.png"

        -- Override the default hearts
        player:hud_set_hotbar_image(heart_texture)
    else
        minetest.log("error", "Player is nil, cannot set custom hearts.")
    end
end)
