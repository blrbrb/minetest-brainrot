mobs:register_mob("brainrot:nugget", {
    -- Basic mob properties
    type = "animal",
    passive = true,
    attack_type = "none",
    hp_min = 5,
    hp_max = 10,
    armor = 100,
    collisionbox = { -0.5, -0.5, -0.5, 0.5, 0.5, 0.5 }, -- Hitbox size
    visual = "upright_sprite",                          -- This makes it a flat image
    visual_size = { x = 1, y = 1 },                     -- Size of the mob (adjust as needed)
    textures = { "brainrot_mobs_nugget.png" },          -- Add your flat image texture here
    makes_footstep_sound = true,
    sounds = {
        random = "nugget_idle",
        damage = "nugget_hurt",
        war_cry = "nugget_warcry"
        -- The sound it will make randomly
    },
    walk_velocity = 1,
    run_velocity = 2,
    jump = true,
    follow = { "default:grass_1" },

    -- Mob behavior
    view_range = 10,
    runaway = false,
    walk_chance = 50, -- 50% chance of walking when idle

    -- Damage and death behavior
    damage = 1,
    drops = {
        { name = "default:apple", chance = 1, min = 1, max = 3 },
    },
    on_punch = function(self, puncher)
        minetest.sound_play("nugget_hurt", {
            object = self.object,
            gain = 1.0,
            max_hear_distance = 15,
        })
    end,
    on_rightclick = function(self, clicker)
        -- Add interaction logic here if needed
    end,

    -- Mob animations (optional, since it's a flat image)
    animation = {
        speed_normal = 24,
        stand_start = 0,
        stand_end = 80,
        walk_start = 81,
        walk_end = 100,
    },
})

-- Register the spawn condition
mobs:spawn({
    name = "brainrot:nugget",
    nodes = { "default:dirt_with_grass" }, -- Spawn on grass
    min_light = 10,
    interval = 30,                         -- How often mobs spawn
    chance = 7000,                         -- Lower the number for more frequent spawns
    active_object_count = 3,               -- Max number of mobs in range
    min_height = 0,
    max_height = 200,
})

-- Register the mob egg for easy spawning in-game
mobs:register_egg("brainrot:nugget", "Nugget", "default_grass.png", 1)
