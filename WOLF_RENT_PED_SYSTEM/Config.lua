Config = {}


Config.BedPlayerCoords = vector4(114.5797, -1304.4935, 29.2695, 26.9042)
Config.HookerBedCoords = vector4(108.7908, -1305.6577, 28.7688, 27.5014)
Config.Account = 'money' -- money, bank or any account that u have in your extended.
Config.Locale = 'en' -- en o es

Config.PimpGuy = {
    { 
        x= 111.2976, 
        y= -1281.1238, 
        z= 27.30, 
        name = "Pimp", 
        heading = 197.32, 
        model = "s_m_m_bouncer_01", 
        text = '~r~AGENT WOLF\n~w~Press ~r~E~w~ to talk',
        hookerFirstSpawn = vector4(115.4051, -1295.6748, 29.2692, 298.2570),
        hookerWalkTo = vector3(101.5219, -1296.1962, 28.7688),
    },   
}

Config.Hookers = {
    {
        id = 1,
        ped = "s_f_y_movprem_01",
        label = "Miya",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1092066660309028894/356d79-Grand_Theft_Auto_V_Screenshot_2018.01.10_-_18.32.06.84.jpg",
        age = 22,
        height = 156,
        weight = 50,
        price = 15000,
        reviews = 99 -- 0-100
    },
    {
        id = 2,
        ped = "a_f_m_fatcult_01",
        label = "Sunny",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098705784453464234/Screenshot_2023-04-21_015249.png",
        age = 23,
        height = 164,
        weight = 52,
        price = 5000,
        reviews = 89 -- 0-100
    },
    {
        id = 3,
        ped = "a_f_m_fatwhite_01",
        label = "Jasmin",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098706350084739183/Screenshot_37s.png",
        age = 24,
        height = 170,
        weight = 56,
        price = 6000,
        reviews = 19 -- 0-100
    },
    {
        id = 4,
        ped = "a_f_m_bodybuild_01",
        label = "Sandra",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098707182800879726/Screenshot_38a.png",
        age = 18,
        height = 170,
        weight = 56,
        price = 5000,
        reviews = 100 -- 0-100
    },
    {
        id = 5,
        ped = "a_f_m_soucent_02",
        label = "Mary",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098707615866966106/Screenshot_39sd.png",
        age = 26,
        height = 170,
        weight = 56,
        price = 10000,
        reviews = 80 -- 0-100
    },
    {
        id = 6,
        ped = "a_m_y_beachvesp_01",
        label = "Lucas",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098710490730999828/Screenshot_a.png",
        age = 26,
        height = 170,
        weight = 56,
        price = 8000,
        reviews = 70 -- 0-100
    },
    {
        id = 7,
        ped = "g_m_m_chemwork_01",
        label = "Romeo",
        img = "https://cdn.discordapp.com/attachments/890204444426403922/1098712766329659462/Screenshot_41a.png",
        age = 37,
        height = 170,
        weight = 56,
        price = 8000,
        reviews = 70 -- 0-100
    }
}

Config['Synced'] = {
        -- NSFW animations vvvvvvvv
        {
            ['AnimId'] = 1,
            ['Label'] = 'Hi',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 0, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.0,
                    ['yP'] = 0.8,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.65,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'hugs_guy_a', ['Flags'] = 0,
            },
        },
        {
            ['AnimId'] = 2,
            ['Label'] = 'Hug',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.1,
                    ['yP'] = 1.10,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.65,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'mp_ped_interaction', ['Anim'] = 'kisses_guy_a', ['Flags'] = 0,
            },
        },
        {
            ['AnimId'] = 3,
            ['Label'] = 'Celebrate',
            ['Requester'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmfanatic1celebrate', ['Anim'] = 'celebrate', ['Flags'] = 0, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.05,
                    ['yP'] = 0.4,
                    ['zP'] = 0.0,
    
                    ['xR'] = 120.0,
                    ['yR'] = 0.0,
                    ['zR'] = 180.0,
                }
            },
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'rcmfanatic1celebrate', ['Anim'] = 'celebrate', ['Flags'] = 0,
            },
        },
        {
            ['AnimId'] = 4,
            ['Label'] = 'Carry Ped', 
            ['Requester'] = {

                ['Type'] = 'animation', ['Dict'] = 'nm', ['Anim'] = 'firemans_carry', ['Flags'] = 33, ['Attach'] = {
                    ['Bone'] = 9816,
                    ['xP'] = 0.27,
                    ['yP'] = 0.15,
                    ['zP'] = 0.63,
    
                    ['xR'] = 0.9,
                    ['yR'] = 0.3,
                    ['zR'] = 0.0,
                },
            }, 
            ['Accepter'] = {
                ['Type'] = 'animation', ['Dict'] = 'missfinale_c2mcs_1', ['Anim'] = '', ['Flags'] = 49,
            },
        },
        --Dances/Alone Animations
        {
            ['AnimId'] = 5,
            ['Alone'] = true,
            ['Label'] = 'Sit', 
            ['Dict'] = 'anim@amb@business@bgen@bgen_no_work@', 
            ['Anim'] = 'sit_phone_phoneputdown_idle_nowork',
        },
        {
            ['AnimId'] = 6,
            ['Alone'] = true,
            ['Label'] = 'Sitchair3', 
            ['Dict'] = 'timetable@reunited@ig_10', 
            ['Anim'] = 'base_amanda',
        },
        {
            ['AnimId'] = 7,
            ['Alone'] = true,
            ['Label'] = 'Sleep', 
            ['Dict'] = 'timetable@tracy@sleep@', 
            ['Anim'] = 'idle_c',
        },
        {
            ['AnimId'] = 8,
            ['Alone'] = true,
            ['Label'] = 'Dance', 
            ['Dict'] = 'anim@amb@nightclub@dancers@podium_dancers@', 
            ['Anim'] = 'hi_dance_facedj_17_v2_male^5',
        },
        {
            ['AnimId'] = 9,
            ['Alone'] = true,
            ['Label'] = 'Dance 2', 
            ['Dict'] = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@', 
            ['Anim'] = 'high_center_down',
        },
        {
            ['AnimId'] = 10,
            ['Alone'] = true,
            ['Label'] = 'Dance 3', 
            ['Dict'] = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_a@', 
            ['Anim'] = 'high_center',
        },
        {
            ['AnimId'] = 11,
            ['Alone'] = true,
            ['Label'] = 'Dance 4', 
            ['Dict'] = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@', 
            ['Anim'] = 'high_center_up',
        },
        {
            ['AnimId'] = 12,
            ['Alone'] = true,
            ['Label'] = 'Clap', 
            ['Dict'] = 'amb@world_human_cheering@male_a', 
            ['Anim'] = 'base',
        },
        {
            ['AnimId'] = 13,
            ['Alone'] = true,
            ['Label'] = 'Lap Dance', 
            ['Dict'] = 'mp_safehouse', 
            ['Anim'] = 'lap_dance_girl',
        },
    
        -- NSFW animations ^^^^^^^
}