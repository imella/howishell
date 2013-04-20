# turn: 0
# resources: # energy must be calculated based on what's installed on the moon
#   money: 10
#   h3: 0
 

# cell defintion
  # thing
    # state
    # thing data
    # actions
  # resourceDensity (must sum 1)
    # rock 
    # silica 0.45
    # he3 0.01
    # alumina 0.15

#findById (id)
  # returns
    # Array of cell indices

# findByKeyword (keyword)
  # returns
    # Array of cell indices

initializeMoon = (width, height) ->
  moon = 
    width: width
    height: height
    cells: []

  [0..width - 1].map (i) ->
    [0..height - 1].map (j) ->
      moon.cells.push(defCell())
  moon


defCell = ->
  silica = Math.random() * 0.45
  he3 = Math.random() * 0.01
  alumina = Math.random() * 0.15
  rock = 1 - silica - he3 - alumina
  {
    resourceDensity:
      rock: rock
      silica: silica
      he3: he3
      alumina: alumina
  }

# beforeMeetingListener Functions
updateState = ->
  console.log "Updating Game State"
  @HIS.state.turn++
  @HIS.state.events
    .filter((e) -> e.turn is @HIS.state.turn)
    .map((e) -> e.action.apply(@HIS, e.args))
  # delete old events :-)

# beforeBudgetListener Functions


# beforeMoonListener Functinos
addBuget = ->
  console.log "Adding budget to the moon"

clearBudget = ->
  console.log "Clearing budget array"

@HIS =
  beforeMeetingListener: [updateState] # Array of functions
  beforeMeeting: ->
    @beforeMeetingListener.map (l) -> l()

  beforeBudgetListener: []
  beforeBudget: ->
    @beforeBudgetListener.map (l) -> l()
    # after dialogs triggers

  beforeMoonListener: [addBuget, clearBudget]
  beforeMoon: ->
    @beforeMoonListener.map (l) -> l()


@HIS.state =
  turn: -1
  events: [] # [{turn: val, function}]
  resources:
    money: 10
    he3: 0
    aluminum: 0
    silicon: 0
    bricks: 0
  moon: initializeMoon(12, 8)
  currentDialog:
    guided: ''
    nonGuided: '' # on click

  # Will be deleted after budget
  budget:
    regular: {} # [{id: val, quantity: val}]
    special: [] # [{name: val, value: val}]
  # TODO: Make a helper Function (HIPSTER CULIAO)
  # Avoid undefined keys (DANIEL CULIAO)

@HIS.data =
  things:
    'cs':
      id: 'cs'
      name: 'Construction Site'
      image_url: 'construction-site.png'
      keywords: []

  advisors:
    'rex_charger':
      id: 'rex_charger'
      name: 'Rex Charger'
      specialty: 'Sustainable Energy Specialist' # Energy
    'dr_yrion':
      id: 'dr_yrion'
      name: 'Dr. Yrion'
      specialty: 'NASA Evangelist' # Life on the moon (tourism)
    'col_telescope':
      id: 'col_telescope'
      name: 'Colonel Telescope'
      specialty: 'Senior Optical Technician at SETI' # Radiotelescope
    'dr_wallo':
      id: 'dr_wallo'
      name: 'Dr. Wallo'
      specialty: 'Senior Research Scientist' # Science
    'jake':
      id: 'jake'
      name: 'Jake Rockwell'
      specialty: 'Secretary of Military and Strategic Defense' # Expansion and Survival


@HIS.dataDef = (id, name, image_url, keywords) -> 
  {
    id: id
    name: name
    image_url: image_url
    keywords: keywords
  }
  

@HIS.buildDef = (costs, factoryIds, robots, turns, bricks, aluminum, silicon, data) ->
  data.keywords.push('build')
  data['build'] =
    costs: costs
    factoryIds: factoryIds
    robots: robots
    turns: turns
    bricks: bricks
    aluminum: aluminum
    silicon: silicon
  data

@HIS.deliveryDef = (costs, data) ->
  data.keywords.push('delivery')
  data['delivery'] =
    costs: costs
  data

@HIS.maintenanceDef = (energy, robots, he3, data) ->
  data.keywords.push('maintenance')
  data['maintenance'] =
    energy: energy
    robots: robots
    he3: he3
  data

@HIS.generatorDef = (energy, he3, bricks, aluminum, silicon, storage, data) ->
  data.keywords.push('generator')
  data['generator'] =
    energy: energy
    he3: he3
    bricks: bricks
    aluminum: aluminum
    silicon: silicon
    storage: storage
  data

@HIS.findCellsByThingId = (id) ->
  @.state.moon.cells.filter (c) -> 
    c.thing.id == id unless c.thing == undefined 

@HIS.findCellsByKeyword = (keyword) ->
  @.state.moon.cells.filter (c) ->
    keyword in c.thing.keywords unless c.thing == undefined

# Income
  # energy
  # he3
  # bricks
  # aluminum
  # silicon

@HIS.inputByResource = (keyword) ->
  @findCellsByKeyword(keyword).map((c) -> c.thing.generator[keyword]).reduce(((a, b) -> a + b), 0)
@HIS.outputByResource = (keyword) ->
  @findCellsByKeyword(keyword).map((c) -> c.thing.maintenance[keyword]).reduce(((a, b) -> a + b), 0)

@HIS.resourceStatus = ->
  inputByResource = (keyword, resourceCalculator) ->
    @HIS.findCellsByKeyword(keyword)
    .filter((c) -> c.thing.generator != undefined and c.thing.generator[keyword] != undefined )
    .map((c) -> resourceCalculator(c.thing.generator[keyword], c))
    .reduce(((m, b) -> m + b), 0)
  outputByResource = (keyword) ->
    @HIS.findCellsByKeyword(keyword)
    .filter((c) -> c.thing.maintenance != undefined and c.thing.maintenance[keyword] != undefined )
    .map((c) -> c.thing.maintenance[keyword])
    .reduce(((m, b) -> m + b), 0)

  ei = inputByResource('energy', (r, c) -> r)
  eo = outputByResource('energy')

  si = inputByResource('storage', (r, c) -> r)
  so = outputByResource('storage')

  {
    energy: 
      input: ei
      output: eo
      gross: ei - eo
    he3: 
      input: inputByResource('he3', (r, c) -> r * c.resourceDensity.he3)
      output: outputByResource('he3')
      total: @state.resources.he3
    bricks: 
      input: inputByResource('bricks', (r, c) -> r * c.resourceDensity.rock)
      output: outputByResource('bricks')
      total: @state.resources.bricks
    aluminum: 
      input: inputByResource('aluminum', (r, c) -> r * c.resourceDensity.alumina)
      total: @state.resources.aluminum
    silicon: 
      input: inputByResource('silicon', (r, c) -> r * c.resourceDensity.silica)
      total: @state.resources.silicon
    storage:
      input: si
      output: so
      gross: si - so
  }

# Checks if the thing is affordable and other conditions
@HIS.isAffordable = (id, cellIndex) ->
  # Check resources

@HIS.isBuildable = (thingId, cellIndex) ->
  if @isAffordable(thingId, cellIndex)
    # Check if spot is available
    # Check if buildable
  else
    false

# Places a Construction site in the cell (specified with the index)
# and schedules an event that will create the thing when its done.
@HIS.build = (thingId, cellIndex) ->
  # Discount resources
  @place(@.data.things.cs)
  t = @.data.things[thingId]
  turnWhenReady = @.state.turn + t.build.turns
  @.state.events.push {turn: turnWhenReady, action: @place, args: [thingId, cellIndex] }


# Places a thing in the map
@HIS.place = (thingId, cellIndex) ->
  cell = @.state.moon.cells[cellIndex]
  cell['thing'] = @.data.things[thingId]
  # cell.thing['state'] = cell.thing.initialState
  cell