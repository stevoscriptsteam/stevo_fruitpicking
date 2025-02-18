return {
    
    interaction = 'target', -- 'textui' 'target'
    
    progressCircle = true, -- If lib progressCircle should be used instead of progressBar
    
    moneyItem = 'money',
    
    types = {
        {   type = 'Apple',
            item = 'apple',
            pickCooldown = 5, -- Cooldown between picking in seconds, set to false for no cooldown
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 2.5,
            interactDistance = 2.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = 'amb@prop_human_movie_bulb@idle_a',
            animClip = 'idle_a',
            scenario = false,
            prop = false,
            marker = { type = 25, color = {r = 255, g = 0, b = 25, a = 80}}, 
            blip = {
                coords = vector3(351.58, 6516.76, 28.48),          
                shortRange = true,
                sprite = 238,
                display = 4,
                scale = 0.4,
                colour = 49,
                name = 'Apple Orchard',
            },
            points = {
                vector3(322.46, 6504.4, 28.195),
                vector3(331.8, 6505.0, 27.55),
                vector3(340.04, 6504.56, 27.72),
                vector3(348.68, 6504.48, 27.79),
                vector3(356.31, 6504.32, 27.45),
                vector3(363.86, 6504.87, 27.56),
                vector3(370.85, 6505.19, 27.40),
                vector3(378.81, 6505.08, 26.965),
                vector3(379.01, 6516.99, 27.35),
                vector3(370.93, 6517.02, 27.39),
                vector3(363.6, 6517.15, 27.31),
                vector3(356.1, 6516.72, 27.18),
                vector3(348.41, 6516.9, 27.76),
                vector3(339.51, 6516.64, 27.98),
                vector3(331.13, 6516.69, 27.98),
                vector3(322.56, 6516.87, 28.125),
                vector3(322.6, 6530.6, 28.16),
                vector3(330.05, 6530.11, 27.62),
                vector3(339.26, 6530.26, 27.60),
                vector3(346.97, 6530.75, 27.70),
                vector3(354.46, 6530.11, 27.445),
                vector3(362.24, 6530.43, 27.44),
                vector3(370.15, 6530.66, 27.44),
            },
            textLabel = '**[E]** - Pick an Apple',
            targetLabel = 'Pick an Apple',
            targetIcon = 'fa-solid fa-apple-whole'
        },
        {   type = 'Orange',
            item = 'orange',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 2.5,
            interactDistance = 2.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = 'amb@prop_human_movie_bulb@idle_a',
            animClip = 'idle_a',
            scenario = false,
            prop = false,
            marker = { type = 25, color = {r = 255, g = 177, b = 9, a = 90}}, 
            blip = {
                coords = vec3(260.4808, 6510.8618, 30.76123),          
                shortRange = true,
                sprite = 238,
                display = 4,
                scale = 0.4,
                colour = 47,
                name = 'Orange Orchard',
            },
            points = {
                vector3(282.86, 6506.12, 29.12),
                vector3(274.43, 6506.94, 29.4),
                vector3(265.05, 6505.77, 29.68),
                vector3(257.5, 6503.68, 29.85),
                vector3(248.03, 6502.51, 30.04),
                vector3(237.65, 6501.58, 30.21),
                vector3(228.77, 6501.02, 30.33),
                vector3(220.93, 6499.08, 30.40),
                vector3(210.91, 6497.72, 30.46),
                vector3(202.41, 6496.5, 30.47),
                vector3(195.07, 6496.7, 30.53),
                vector3(186.2, 6497.32, 30.55),
                vector3(199.7, 6507.55, 30.52),
                vector3(209.4, 6509.01, 30.48),
                vector3(218.65, 6509.31, 30.40),
                vector3(226.91, 6510.91, 30.33),
                vector3(234.9, 6511.87, 30.24),
                vector3(245.35, 6514.55, 30.09),
                vector3(254.48, 6513.54, 29.92),
                vector3(263.12, 6516.01, 29.71),
                vector3(273.31, 6518.47, 29.43),
                vector3(281.98, 6517.99, 29.16),
                vector3(280.88, 6529.83, 29.195),
                vector3(271.21, 6529.84, 29.495),
                vector3(262.52, 6527.03, 29.74),
                vector3(252.87, 6526.7, 29.95),
                vector3(243.64, 6525.51, 30.13),
                vector3(234.44, 6524.25, 30.24),
                vector3(224.7, 6522.98, 30.345),
            },
            textLabel = '**[E]** - Pick an Orange',
            targetLabel = 'Pick an Orange',
            targetIcon = 'fa-solid fa-seedling'
        },
        {   type = 'Pineapple',
            item = 'pineapple',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 2.5,
            interactDistance = 2.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = false,
            animClip = false,
            scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
            prop = 'xm3_prop_xm3_pineapple_01a',
            marker = { type = 25, color = {r = 230, g = 192, b = 22, a = 80}}, 
            blip = {
                coords = vector3(535.46, 6505.79, 30.17),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.4, -- float
                colour = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Pineapple Patch',
            },
            points = {
                vec3(534.8874, 6517.0, 29.18),
                vec3(534.9344, 6511.0, 29.18),
                vec3(534.9344, 6505.0, 29.28),
                vec3(534.9344, 6499.0, 29.18),
                vec3(534.9344, 6493.0, 29.38),
                vec3(534.9344, 6487.0, 29.78),
                vec3(534.9344, 6481.0, 29.83),
                vec3(534.9759, 6475.0, 29.80),
                vec3(534.9411, 6469.0, 29.85),
                vec3(534.9411, 6463.0, 29.85),
                vec3(534.9411, 6457.0, 29.18),
            },
            textLabel = '**[E]** - Pick a Pineapple',
            targetLabel = 'Pick Pineapple',
            targetIcon = 'fas fa-seedling'
        },
        {   type = 'Potato',
            item = 'potato',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 10,
            interactDistance = 2.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = false,
            animClip = false,
            scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
            prop = 'prop_plant_fern_02a',
            marker = { type = 25, color = {r = 110, g = 55, b = 9, a = 100}}, 
            blip = {
                coords = vector3(278.93, 6479.1, 30.25),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.4, -- float
                colour = 10, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Potato Patch',
            },
            points = {
                vector3(285.52, 6481.99, 29.02),
                vector3(283.15, 6481.75, 29.055),
                vector3(280.57, 6481.56, 29.165),
                vector3(278.19, 6481.52, 29.23),
                vector3(275.8, 6481.19, 29.28),
                vector3(273.58, 6481.2, 29.34),
                vector3(271.17, 6480.95, 29.405),
                vector3(285.79, 6477.91, 29.15),
                vector3(283.37, 6477.71, 29.25),
                vector3(280.92, 6477.56, 29.3055),
                vector3(278.62, 6477.27, 29.39),
                vector3(276.17, 6477.09, 29.445),
                vector3(273.85, 6477.06, 29.51),
                vector3(271.59, 6476.71, 29.575),
            },
            textLabel = '**[E]** - Pick a Potato',
            targetLabel = 'Pick a Potato',
            targetIcon = 'fas fa-potato'
        },
        {   type = 'Tomato', 
            item = 'tomato',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 1.5,
            interactDistance = 1.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = 'missmechanic',
            animClip = 'work_base',
            scenario = false,
            prop = false,
            marker = { type = 25, color = {r = 255, g = 0, b = 25, a = 80}}, 
            blip = {
                coords = vector3(322.82, 6479.73, 29.55),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.4, -- float
                colour = 1, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Tomato Plants',
            },
            points = {
                vector3(323.37, 6484.24, 28.14),
                vector3(323.4, 6481.54, 28.30),
                vector3(323.3, 6478.96, 28.48),
                vector3(323.24, 6476.17, 28.65),
                vector3(321.22, 6476.3, 28.635),
                vector3(321.14, 6479.12, 28.48),
                vector3(321.16, 6481.6, 28.37),
                vector3(321.2, 6484.0, 28.26),
            },
            textLabel = '**[E]** - Pick a Tomato',
            targetLabel = 'Pick a Tomato',
            targetIcon = 'fas fa-seedling'
        },
        {   type = 'Pumpkin',  
            item = 'pumpkin',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },
            pickDuration = 3,
            viewDistance = 1.5,
            interactDistance = 1.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = false,
            animClip = false,
            scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
            prop = false,
            marker = { type = 25, color = {r = 255, g = 128, b = 0, a = 90}},
            blip = {
                coords = vector3(505.64, 6511.83, 29.55),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.4, -- float
                colour = 47, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Pumpkin Patch',
            },
            points = {
                vector3(501.14, 6517.88, 29.23),
                vector3(501.44, 6515.62, 29.155),
                vector3(500.68, 6513.82, 29.17),
                vector3(500.91, 6511.84, 29.125),
                vector3(500.91, 6510.08, 29.130),
                vector3(501.38, 6507.44, 29.12),
                vector3(509.43, 6518.48, 28.857),
                vector3(509.76, 6516.21, 28.88),
                vector3(509.53, 6514.45, 28.89),
                vector3(509.21, 6512.45, 28.86),
                vector3(509.19, 6510.66, 28.84),
                vector3(509.25, 6509.0, 28.83),
            },
            textLabel = '**[E]** - Pick a Pumpkin',
            targetLabel = 'Pick a Pumpkin',
            targetIcon = 'fas fa-seedling'
        },  
        {   type = 'Strawberry',  
            item = 'strawberry',
            pickChance = { -- The amount of something you have a chance of picking. Set max to 1 for one at a time
                min = 1,
                max = 3
            },            
            pickDuration = 3,
            viewDistance = 1.5,
            interactDistance = 1.5,
            skillCheck = {'easy', 'easy', 'medium'},
            animDict = false,
            animClip = false,
            scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',
            prop = false,
            marker = { type = 25, color = {r = 255, g = 0, b = 25, a = 80}},
            blip = {
                coords = vector3(347.36, 6484.64, 29.21),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.4, -- float
                colour = 1, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Strawberry Patch',
            },
            points = {
                vector3(344.03, 6483.68, 28.2),
                vector3(343.85, 6481.17, 28.34),
                vector3(343.76, 6478.8, 28.53),
                vector3(343.71, 6476.35, 28.71),
                vector3(342.16, 6476.47, 28.62),
                vector3(342.12, 6479.66, 28.48),
                vector3(342.01, 6481.9, 28.28),
                vector3(342.07, 6484.44, 28.12),
            },
            textLabel = '**[E]** - Pick a Strawberry',
            targetLabel = 'Pick a Strawberry',
            targetIcon = 'fas fa-seedling'
        },       
    },


    fruitBuyers = {
        {
            viewDistance = 50, 
            interactDistance = 2.5, 
            targetIcon = 'fas fa-shop',
            ped = {
                model = 'a_m_m_farmer_01',
                coords = vector4(411.55, 6459.23, 27.81, 13.82),
                scenario = 'WORLD_HUMAN_CLIPBOARD'
            },
            stand = {
                model = 'prop_fruitstand_b',
                coords = vector4(410.73, 6459.27, 28.81, 182.83),              
            },
            blip = {
                coords = vector3(411.01, 6461.1, 28.81),    
                shortRange = true,
                sprite = 52, 
                display = 4,
                scale = 0.6, 
                colour = 32, 
                name = 'Fruit Buyer',
            },
            items = {
                ['apple'] = {label = 'Apple', sale = 100, multiple = true, icon = '',},
                ['orange'] = {label = 'Orange', sale = 100, multiple = true, icon = '',},
                ['potato'] = {label = 'Potato', sale = 100, multiple = true, icon = '',},
                ['tomato'] = {label = 'Tomato', sale = 100, multiple = true, icon = '',},
                ['pineapple'] = {label = 'Pineapple', sale = 100, multiple = true, icon = ''},
                ['strawberry'] = {label = 'Strawberry', sale = 100, multiple = true, icon = ''},
                ['pumpkin'] = {label = 'Pumpkin', sale = 100, multiple = true, icon = ''},
            },
        }
    },


    debug = true
    
}
