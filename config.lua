Config = Config or {}

Config.NotifyType = 'qb' -- supports: qb, okok, and k5

------------------
---- STEALING ----

Config.PoliceJobs = { 'police', 'sheriff' }
Config.Police = 100 -- chance of a police notification from 0 to 100 
Config.Dispatch = nil -- the dispatch script you use. supports project sloth ('ps') and quasar ('qs'). nil if no police notis


Config.StealLocations = { vector4(-699.42, -2.1, 38.13, 200) }
-- the w coord in the vector4(x,y,z,w) will determine the rotation of the box. this is w coord is the direction your player is facing.
Config.Difficulty = 'easy' -- the difficulty of the skillchecks. nil, 'easy', 'normal', 'hard'.  if nil then no skillchecks


Config.StealText = 'Steal Cough Syrup' -- the text for the third eye at StealLocations
Config.Stealing = 'PROP_HUMAN_PARKING_METER' -- if u have custom a scenario (not anim) or want to change the ones i chose. 
Config.StealingText = 'Stealing Cough Syrup' -- the text that plays in the progress bar while stealing syrup
Config.StealTime = 2 -- how long the progress bar lasts in seconds. the progress bar is played after the player complete the skill check. 


Config.Reward = 2 -- amount of cough syrup bottles the player gets when stealing successfully
Config.Random = true --[[ if true then the above reward value will be set as the MAX amount a player can earn when stealing successfully, min will be one.
if false^ then the player will just receive that amount every time. ]]


--[[ the target box for stealing. you can probably leave it alone; by default it is a little bit taller and wider than the player, and should provide a smooth thirdeye along a surface.
the main changing you should be doing however is the rotation of the target box in the w coord. 
]]
Config.DebugPoly = false -- draws the box for debugging
Config.BoxZoneL = 1.0 -- ^^ length of box zone
Config.BoxZoneW = 0.65 -- width
Config.Zoffset = 1.05 -- how tall the box is.



-------------------- 
-- DRINK & MIXING --


Config.DrinkSprite = 2 -- how long it takes to drink sprite in seconds
Config.DrinkLean = 2 -- how long it takes to drink lean 


Config.CoughSyrup = 2 -- how much cough syrup is used when mixed with one sprite bottle 
Config.JollyRancherBag = 2 -- how many jolly ranchers come in one bag when opened
Config.JollyRanchers = 2 -- how many jolly ranche rs are needed to make lean
Config.JollyHunger = 5 -- hunger gained when eating jolly ranchers


Config.SpriteText = 'Drinking Sprite' -- text in progress bar while drinking
Config.LeanText = 'Sippin Sizzurp' -- ^^


Config.SpriteDrinking = 'WORLD_HUMAN_DRINKING' -- if u have custom a scenario (not anim) or want to change the ones i chose
Config.LeanDrinking = 'WORLD_HUMAN_DRINKING' -- ^^


Config.SpriteThirst = 20 -- how much thirst the player gains when drinking regular sprite. min-max = -100 - 100 
Config.LeanThirst = 5 -- < thirst gain when drinking lean. negative values supported


Config.LeanHigh = 300 -- how long the high lasts in seconds, 0 if no effects. 300 seconds is 5 mins.
 
 
















