# vL-lean

must have https://github.com/kac5a/k5_skillcheck for this resource to work

support and dev discord: https://discord.gg/ktzjBM2MkZ

QBCore Lean Script

can drink and get high off the lean. 

details:

https://streamable.com/cxea7m 

there are two methods to drinking and making lean: in the cup and in the bottle.

when using the styrofoam cup, it will check if the player has a lean bottle. if yes, then the player will 'pour' their lean into the cup and get a lean cup.

if there is no lean bottle then it will look to mix a lean cup with jolly ranchers, sprite, and cough syrup. if the player has none, then no lean will be made.

additionally, a player can mix lean using the cough syrup bottle itself. 

when using the cough syrup, it will look for: a styrofoam cup, a sprite bottle, and jolly ranchers. if player has all materials then a lean cup will be made.

if no styrofoam cup, then a lean bottle will be made. if the player has insufficient materials, then no lean will be made.

players can get high and recieve a defined thirst value in the config from the lean and sprite. 

jolly ranchers can be eaten for a predefined hunger value.

can define multiple cough syrup stealing locations.edit the anims and text in the progressbar through the config.

editing of all the targetboxes for these stealing locations can also be edited through the config. 


qbcore shared items:

['coughsyrup'] = {['name'] = 'coughsyrup', ['label'] = 'Cough Syrup', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'coughsyrup.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false, ['description'] = 'A Styrofoam cup'},

['sprite'] = {['name'] = 'sprite', ['label'] = 'Sprite', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'sprite.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false,  ['description'] = 'Sprite'},

['jollyrancherbag'] = {['name'] = 'jollyrancherbag', ['label'] = 'Jolly Rancher Bag', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'jollyrancherbag.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false, ['description'] = 'Bag full of Jolly Ranchers'},

['jollyranchers'] = {['name'] = 'jollyranchers', ['label'] = 'Jolly Ranchers', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'jollyranchers.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false, ['description'] = 'Some Jolly Ranchers'},

['foamcup'] = {['name'] = 'foamcup', ['label'] = 'Styrofoam Cup', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'foamcup.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false, ['description'] = 'A Styrofoam cup'},

['leancup'] = {['name'] = 'leancup', ['label'] = 'Lean Cup', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'leancup.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false,  ['description'] = 'Purple Drank'},

['leanbottle'] = {['name'] = 'leanbottle', ['label'] = 'Lean Bottle', ['weight'] = 0,  ['type'] = 'item', ['image'] = 'leanbottle.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = false,  ['description'] = 'Purple Drank'},






