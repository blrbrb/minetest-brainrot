-- random_hud_image/init.lua

-- Table of image textures to randomly choose from
local images = {
    "brainrot_jumpscare_drake.png",
    "brainrot_jumpscare_danger.png",
    "brainrot_jumpscare_trollface.png",
    "brainrot_jumpscare_panic.png",
    "brainrot_jumpscare_logan.png",
    "brainrot_jumpscare_john_pork.png",
    "brainrot_jumpscare_kill_everyone.png",
    "brainrot_jumpscare_arrow.png"
}

-- Sound file to play when player takes damage
local damage_sound = "damage_sound.ogg"

-- Function to display a random image at a random position on the HUD
local function display_random_image(player)
    -- Get a random image
    local image = images[math.random(#images)]

    -- Get random coordinates for the HUD position
    local x_pos = math.random(0, 1)
    local y_pos = math.random(0, 1)

    -- Add HUD element for the player
    local hud_id = player:hud_add({
        hud_elem_type = "image",
        position = { x = x_pos, y = y_pos }, -- Random position
        scale = { x = 0.5, y = 0.5 },        -- Scale of the image
        text = image,                        -- Image texture
        alignment = { x = 1, y = 1 },        -- Alignment of the image
        offset = { x = 0, y = 0 },           -- No offset
    })

    -- Remove the image after 3 seconds
    minetest.after(2, function()
        player:hud_remove(hud_id)
    end)
end

-- Register a callback when the player takes damage
minetest.register_on_player_hpchange(function(player, hp_change)
    -- If hp_change is negative, it means the player took damage
    if hp_change < 0 then
        -- Play sound for the player
        minetest.sound_play(damage_sound, {
            to_player = player:get_player_name(),
            gain = 1.0,
        })

        -- Display a random image on the HUD
        display_random_image(player)
    end

    -- Return the modified hp_change value (this is required)
    return hp_change
end, true)

-- Register the mod media (sounds and images)
minetest.register_on_mods_loaded(function()
    -- Make sure to define your images and sound files in the `textures/` and `sounds/` folder
    minetest.log("action", "[random_hud_image] Mod loaded and ready!")
end)
