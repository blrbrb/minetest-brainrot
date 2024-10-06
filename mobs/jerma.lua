mobs:register_mob("brainrot:jerma", {
    -- Basic mob properties
    type = "Twitch Streamer",
    passive = true,
    attack_type = "none",
    hp_min = 5,
    hp_max = 10,
    armor = 100,
    collisionbox = { -0.5, -1.0, -0.5, 0.5, 1.0, 0.5 },
    visual = "upright_sprite",
    visual_size = { x = 1.5, y = 2 },
    textures = { "brainrot_mobs_jerman.png" },
    makes_footstep_sound = true,
    sounds = {
        random = "jerma_idle",
        damage = "jerma_damage",
        war_cry = "jerma_warcry"
        -- The sound it will make randomly
    },
    walk_velocity = 1,
    run_velocity = 2,
    jump = true,
    follow = { "default:grass_1" }, -- can never touch grass

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
        minetest.sound_play("jerma_damage", {
            object = self.object,
            gain = 1.0,
            max_hear_distance = 15,
        })
    end,
    on_step = function(self, puncher)
        minetest.sound_play("jerma_warcry", {
            object = self.object,
            gain = 2.0,
            max_hear_distance = 15,
        })
    end,
    on_death = function(self, puncher)
        minetest.sound_play("jerma_dead", {
            object = self.object,
            gain = 1.0,
            max_hear_distance = 15,
        })
    end,

})

-- Register the spawn condition
mobs:spawn({
    name = "brainrot:jerma",
    nodes = { "default:dirt_with_grass", "default:sand", "default:snow" }, -- Spawn on grass
    min_light = 10,
    interval = 30,                                                         -- How often mobs spawn
    chance = 1000,                                                         -- Lower the number for more frequent spawns
    active_object_count = 3,                                               -- Max number of mobs in range
    min_height = 0,
    max_height = 200,
})

-- Register the mob egg for easy spawning in-game
mobs:register_egg("brainrot:jerma", "Jerma", "default_grass.png", 1)
