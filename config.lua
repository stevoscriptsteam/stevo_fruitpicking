return {

    interaction = 'target', -- 'textui' 'target' availible
    progressCircle = false, -- If lib progressCircle should be used instead of progressBar
    moneyItem = 'money',
    types = {
        { -- Apple Orchard
            type = 'Apple', -- label
            item = 'apple',
            pickChance = 1, -- Can use math.random(1, 5), basically amount of oranges you receive every time you pick
            pickDuration = 3, -- In seconds
            viewDistance = 3,
            interactDistance = 1.5,
            skillCheck = {'easy', 'easy'},
            animDict = 'amb@prop_human_movie_bulb@idle_a',
            animClip = 'idle_a',
            scenario = false,

            marker = { -- set to false for no marker. (Doesnt show if target is selected for interaction)
                type = 21, 
                color = {r = 255, g = 0, b = 25, a = 80}
            }, 

            blip = {
                coords = vec3(260.4808, 6510.8618, 30.76123),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.8, -- float
                colour = 49, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Apple Orchard',
            },

            prop = false, -- If prop should show at fruit point. (Doesnt show if target is selected for interaction)

            points = {
                vec3(282.0303, 6507.1504, 30.1290),
                vec3(273.2071, 6507.9883, 30.4207),
                vec3(263.8141, 6506.5249, 30.6805),
                vec3(255.9330, 6504.5835, 30.8711),
                vec3(246.9419, 6503.7373, 31.0455),
                vec3(236.8672, 6502.7012, 31.2011),
                vec3(227.6509, 6502.0396, 31.3149),
                vec3(219.7940, 6500.4033, 31.3860),
                vec3(209.7320, 6498.8906, 31.46320),
                vec3(201.3778, 6497.7441, 31.4853),
                vec3(194.1302, 6497.7822, 31.5238),
                vec3(185.0864, 6498.6494, 31.5398),
                vec3(281.0388, 6518.1899, 30.1710),
                vec3(272.7289, 6518.6450, 30.4333),
                vec3(262.5750, 6515.9878, 30.7070),
                vec3(253.3770, 6513.5425, 30.9258),
                vec3(244.8159, 6514.6108, 31.0859),
                vec3(234.6038, 6511.9609, 31.2346),
                vec3(225.8677, 6510.6772, 31.3309),
                vec3(217.6273, 6509.4834, 31.4029),
                vec3(208.2866, 6509.0166, 31.4721),
                vec3(199.4386, 6507.9961, 31.5082),
                vec3(224.3214, 6523.0283, 31.3476),
                vec3(233.5560, 6524.1982, 31.2474),
                vec3(243.5869, 6525.3403, 31.1015),
                vec3(251.8572, 6526.9321, 30.9610),
                vec3(261.6895, 6526.9033, 30.7365),
                vec3(270.7364, 6529.7563, 30.4953),
                vec3(280.6907, 6529.9282, 30.1832)

            },

            textLabel = '**[E]** - Pick Apple',
            targetLabel = 'Pick Apple',
            targetIcon = 'fas fa-lemon'
        },
        { -- Pineapple Patch
            type = 'Pineapple', -- label
            item = 'pineapple',
            pickChance = 1, -- Can use math.random(1, 5), basically amount of oranges you receive every time you pick
            pickDuration = 3, -- In seconds
            viewDistance = 3,
            interactDistance = 1.5,
            skillCheck = {'easy', 'easy'},
            animDict = false,
            animClip = false,
            scenario = 'CODE_HUMAN_MEDIC_TEND_TO_DEAD',

            marker = { -- set to false for no marker. (Doesnt show if target is selected for interaction)
                type = 21, 
                color = {r = 255, g = 226, b = 61, a = 80}
            }, 

            blip = {
                coords = vec3(534.7406, 6502.6357, 30.1824),          
                shortRange = true,
                sprite = 238, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.8, -- float
                colour = 5, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Pineapple Patch',
            },

            prop = 'xm3_prop_xm3_pineapple_01a', -- If prop should show at fruit point.

            points = {
                vec3(534.8874, 6517.0, 30.0),
                vec3(534.9344, 6511.0, 30.0),
                vec3(534.9344, 6505.0, 30.0),
                vec3(534.9344, 6499.0, 30.0),
                vec3(534.9344, 6493.0, 30.0),
                vec3(534.9344, 6487.0, 30.0),
                vec3(534.9344, 6481.0, 30.0),
                vec3(534.9759, 6475.0, 30.0),
                vec3(534.9411, 6469.0, 30.0),
                vec3(534.9411, 6463.0, 30.0),
                vec3(534.9411, 6457.0, 30.0),
                vec3(534.9411, 6451.0, 30.0),
                vec3(534.9411, 6445.0, 30.0),
                vec3(534.9411, 6439.0, 30.0),
                vec3(534.9411, 6433.0, 30.0)
                
                
            },

            textLabel = '**[E]** - Pick Pineapple',
            targetLabel = 'Pick Pineapple',
            targetIcon = 'fas fa-carrot'
        }
    },
    fruitBuyers = {
        {
            viewDistance = 15, 
            interactDistance = 1.5, 
            targetIcon = 'fas fa-shop',
            ped = {
                model = 'a_m_m_farmer_01',
                coords = vec4(137.1180, 6440.6230, 30.643, 224.6576),
                scenario = 'WORLD_HUMAN_CLIPBOARD'
            },
            stand = { -- Set to false if you dont want the stand to spawn.
                model = 'prop_fruitstand_b',
                coords = vec4(137.1369934082, 6441.4360351562, 30.640298843384, 43),              
            },
            blip = {
                coords = vec3(136.1453, 6441.2646, 31.5695),          
                shortRange = true,
                sprite = 52, -- https://docs.fivem.net/docs/game-references/blips/#blips
                display = 4,
                scale = 0.8, -- float
                colour = 32, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
                name = 'Fruit Buyer',
            },
            items = {
                ['apple'] = {label = 'Apple', sale = 150, multiple = true, icon = 'https://media.discordapp.net/attachments/1091282605657301013/1288459583953571946/apple.png?ex=66f542ff&is=66f3f17f&hm=73487afded796992e313e8758e6a82e8697d5ff2daa971326a754112c75bc979&=&format=webp&quality=lossless',},
                ['pineapple'] = {label = 'Pineapple', sale = 150, multiple = false, icon = 'https://media.discordapp.net/attachments/1091282605657301013/1288459584205357067/pineapple.png?ex=66f542ff&is=66f3f17f&hm=8e47482a286af6d26350b1bbe40696d67706764c4be3d840b25ac8f3b59a3a12&=&format=webp&quality=lossless'}
            },
        }
    },


    debug = true
    
}