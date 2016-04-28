# Import file "framerOnboard_12-9"
sketch = Framer.Importer.load("imported/framerOnboard_12-9@1x")

cardOne = sketch.card1
cardTwo = sketch.card2
cardOne.draggable.enabled = true
cardTwo.draggable.enabled = true
cardOne.draggable.vertical = false
cardTwo.draggable.vertical = false

# inital setup
sketch.placeholder1.opacity = 0
sketch.placeholder2.opacity = 0
sketch.card3.opacity = 0
cardTwo.x = 700
cardTwo.y = 300
cardTwo.scale = 0.85
cardTwo.originX = 0
cardTwo.originY = 0

# activeDots
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
activeDot.states.animationOptions = curve: "spring(400, 20, 0)"

# add states
cardOne.states.add
	two:
		x: -510
		y: 300
		scale: 0.85
		originX: 1
		originY: 0

cardTwo.states.add
	two:
		x: 94
		y: 268
		z: 2
		scale: 1
		originX: 0
		orignY: 0

# on drag event
cardOne.onDragEnd (event, layer) ->
	if cardOne.x < 15
		cardOne.states.switch("two")
		cardTwo.states.switch("two")
		activeDot.states.switch("two")
	else
		cardOne.states.switch("default")
		cardTwo.states.switch("default")
		activeDot.states.switch("default")
	
cardTwo.onDragEnd (event, layer) ->
	if cardTwo.maxX > 735
		cardOne.states.switch("default")
		cardTwo.states.switch("default")
		activeDot.states.switch("default")
	else
		cardOne.states.switch("two")
		cardTwo.states.switch("two")
		activeDot.states.switch("two")

cardOne.animationOptions = curve: "spring(300, 30, 0)"
cardTwo.animationOptions = curve: "spring(300, 20, 0)"



