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
  silica = Math.random() * 0.5
  he3 = Math.random() * 0.2
  alumina = Math.random() * 0.3
  rock = 1 - silica - he3 - alumina
  {
    resourceDensity:
      rock: Number((rock).toFixed(1))
      silica: Number((silica).toFixed(1))
      he3: Number((he3).toFixed(1))
      alumina: Number((alumina).toFixed(1))
  }

initialAvailableToPlace = () ->
  (i for k,i of @HIS.data.things when 'delivery' in i.keywords).reduce(((m, i) -> m[i.id] = {id: i.id, quantity: 0}; m),{})

# beforeMeetingListener Functions
updateState = ->
  console.log "Updating Game State"
  @HIS.state.availableToPlace ?= initialAvailableToPlace()

  @HIS.state.turn++
  @HIS.state.events
    .filter((e) -> e.turn is @HIS.state.turn)
    .map((e) -> e.action.apply(@HIS, e.args))
  # delete old events :-)

  # Reduce batteries
  for battery in @HIS.findCellsByThingId('battery')
    battery.thing.generator.energy -= 1 if battery.thing.generator.energy > 0

# beforeBudgetListener Functions


# beforeMoonListener Functinos
addBuget = ->
  console.log "Adding budget to the moon"
  for k, i of @HIS.state.budget.regular
    @HIS.state.availableToPlace[i.id].quantity += i.quantity

  # I add the robots sent directly to the state
  @HIS.state.resources.robots += @HIS.state.availableToPlace.scv.quantity
  @HIS.state.availableToPlace.scv.quantity = 0


clearBudget = ->
  console.log "Clearing budget array"
  @HIS.state.budget.regular = initialAvailableToPlace()
  @HIS.state.budget.special = []

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
  firstJakeQuestCompleted: 'notGiven'
  secondJakeQuestCompleted: 'notGiven'
  resources:
    money: 10
    he3: 0
    aluminum: 0
    silicon: 0
    bricks: 0
    robots: 0
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

@HIS.win = (victoryCondition) ->
  console.log "You have achieved a #{victoryCondition} Victory!"

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

@HIS.checkBuildResources = (thingId) ->
  @data.things[thingId].build.costs <= @state.resources.money &&
    @data.things[thingId].build.aluminum <= @state.resources.aluminum &&
    @data.things[thingId].build.silicon <= @state.resources.silicon &&
    @data.things[thingId].build.bricks <= @state.resources.bricks &&
    @data.things[thingId].build.robots <= @state.resources.robots

@HIS.discountBuildResources = (thingId) ->
  @state.resources.money -= @data.things[thingId].build.costs
  @state.resources.aluminum -= @data.things[thingId].build.aluminum
  @state.resources.silicon -= @data.things[thingId].build.silicon
  @state.resources.bricks -= @data.things[thingId].build.bricks
  @state.resources.robots -= @data.things[thingId].build.robots

@HIS.isBuildable = (thingId, cellIndex) ->
  @checkBuildResources(thingId) &&
    @HIS.state.moon.cells[cellIndex].thing == undefined &&
    'build' in @HIS.data.things[thingId].keywords

@HIS.createSCV = ()->
  @discountBuildResources('scv')
  @state.resources.robots++

# Places a Construction site in the cell (specified with the index)
# and schedules an event that will create the thing when its done.
@HIS.build = (thingId, cellIndex) ->
  @discountBuildResources(thingId)
  if t.id is 'laser'
    @state.firstJakeQuestCompleted = 'completed'
  if t.id is 'shield'
    @state.secondJakeQuestCompleted = 'completed'
    @win("Defense and Expansion")
  @place('cs', cellIndex)
  t = @data.things[thingId]
  if t.build.costs > 0
    HIS.state.budget.special.push {name: "Special equipement #{t.name}", value: t.build.costs}
  turnWhenReady = @state.turn + t.build.turns
  @state.events.push {turn: turnWhenReady, action: ((thingId, cellIndex) -> @place(thingId, cellIndex); @state.resources.robots += @data.things[thingId].build.robots), args: [thingId, cellIndex] }

@HIS.buildables = ->
  $.map(@data.things, (a) -> a)
    .filter((t) -> 
      return false if t.id is 'laser' and not (HIS.state.firstJakeQuestCompleted is 'given')
      return false if t.id is 'shield' and not (HIS.state.secondJakeQuestCompleted is 'given')
      t.build && HIS.checkBuildResources(t.id))

@HIS.isPlaceable = (thingId, cellIndex) ->
  @state.moon.cells[cellIndex].thing == undefined &&
    'delivery' in @HIS.data.things[thingId].keywords &&
    @state.availableToPlace[thingId].quantity > 0

@HIS.placeFromAvailables = (thingId, cellIndex) ->
  @place(thingId, cellIndex)
  @state.availableToPlace[thingId].quantity--

# Places a thing in the map
@HIS.place = (thingId, cellIndex) ->
  console.log "place thingId=#{thingId} cellIndex=#{cellIndex}"
  cell = @state.moon.cells[cellIndex]
  t = @data.things[thingId]
  s = {}
  s = {working: false} if 'maintenance' in t.keywords

  cell['thing'] = $.extend(true, s, t)
  # cell.thing['state'] = cell.thing.initialState
  cell
