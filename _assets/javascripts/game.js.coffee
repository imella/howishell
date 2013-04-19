# turn: 0
# resources: # energy must be calculated based on what's installed on the moon
#   money: 10
#   h3: 0
 
initializeMoon = (width, height) ->
  moon = 
    width: width
    height: height
    cells: []

  [0..width - 1].map (i) ->
    [0..height - 1].map (j) ->
      moon.cells.push(0)
  moon



@HIS =
  turn: 0
  resources:
    money: 10
    h3: 0
  moon: initializeMoon(40, 20)