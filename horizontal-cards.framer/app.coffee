# Import file "framerOnboard_12-9"
sketch = Framer.Importer.load("imported/framerOnboard_12-9@1x")

# inital setup
sketch.placeholder1.opacity = 0
sketch.placeholder2.opacity = 0

cardOne = sketch.card1
cardTwo = sketch.card2
cardThree = sketch.card3
cardOne.draggable.enabled = true
cardOne.draggable.vertical = false
cardTwo.draggable.enabled = true
cardTwo.draggable.vertical = false
cardThree.draggable.enabled = true
cardThree.draggable.vertical = false

# variables and thresholds
cardScale = 0.85 
cardLeft = 700
cardRight = 1100 
cardTop = 300

dragLeft = 15
dragRight = 160

# initial positions
cardTwo.x = cardLeft
cardTwo.y = cardTop
cardTwo.scale = cardScale
cardTwo.originX = 0
cardTwo.originY = 0
cardThree.x = cardRight
cardThree.y = cardTop
cardThree.scale = cardScale
cardThree.originX = 0
cardThree.originY = 0

# activeDot
activeDot = new Layer
	y: 1248
	x: 314
	borderRadius: 100
	width: 20
	height: 20
	backgroundColor: "#6563A4"

activeDot.states.add
	two:
		x: 367
	three: 
		x: 418
activeDot.states.animationOptions = curve: "spring(400, 20, 0)"

# add states
cardOne.states.add
	two:
		x: -511
		y: cardTop
		scale: cardScale
		originX: 1
		originY: 0
	three:
		x: -1111
		y: cardTop
		originX: 1
		originY: 0
cardOne.animationOptions = curve: "spring(300, 30, 0)"

cardTwo.states.add
	two:
		x: 94
		y: 268
		z: 2
		scale: 1
		originX: 0
		orignY: 0
	three:
		scale: cardScale 
		x: -511
		y: cardTop
		originX: 1
		originY: 0
		z: 1
cardTwo.animationOptions = curve: "spring(300, 30, 0)"

cardThree.states.add
	two:
		scale: cardScale
		x: cardLeft
		y: cardTop
		originX: 0
		originY: 0
		z: 1
	three:
		scale: 1
		x: 94
		y: 268
		originX: 0
		originY: 0
		z: 2
cardThree.animationOptions = curve: "spring(300, 30, 0)"

# function for switches
cards = []

for name, layer of sketch
	if name.match(/card./i)
		cards.push layer

switchDefault = () ->
	for card in cards
		card.states.switch("default")

switchTwo = () ->
	for card in cards
		card.states.switch("two")

switchThree = () ->
	for card in cards
		card.states.switch("three")

# on drag event
cardOne.onDragEnd (event, layer) ->
	if cardOne.x < dragLeft
		switchTwo()
		activeDot.states.switch("two")
	else
		switchDefault()
		activeDot.states.switch("default")
	
cardTwo.onDragEnd (event, layer) ->
	if cardTwo.x > dragRight
		switchDefault()
		activeDot.states.switch("default")
	else if cardTwo.x < dragLeft
		switchThree()
		activeDot.states.switch("three")
	else
		switchTwo()
		activeDot.states.switch("two")

cardThree.onDragEnd (event, layer) ->
	if cardThree.x > dragRight
		switchTwo()
		activeDot.states.switch("two")
	else
		switchThree()
		activeDot.states.switch("three")






