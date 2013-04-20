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



build = (id, x, y) ->
  # Check if spot is available
  # t =  @HIS.things[id]
  # Check resources
  # Discount resources
  # addEvent (turn, function) 
  #   turn = current + t.build.turns
  #   setInPosition(x, y, t) 
  # setInPosition (x, y, @HIS.things['cs'])


# beforeMeetingListener Functions
# Turn++
updateState = ->
  console.log "Updating Game State"

cleanDialogs = ->

createDialogs = ->  

# beforeBudgetListener Functions


# beforeMoonListener Functinos
addBuget = ->
  console.log "Adding budget to the moon"

clearBudget = ->
  console.log "Clearing budget array"

@HIS =
  beforeMeetingListener: [updateState, cleanDialogs, createDialogs] # Array of functions
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
    h3: 0
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
      specialty: 'Sustainale Energy Specialist' # Energy
    'dr_yrion':
      id: 'dr_yrion'
      name: 'Dr. Yrion'
      specialty: 'NASA Evangelist' # Life on the moon (tourism)
    'col_telescope':
      id: 'col_telescope'
      name: 'Colonel Telescope'
      specialty: 'Senior Optical Technician @SETI' # Radiotelescope
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

@HIS.deliveryDef = (costs, turns, data) ->
  data.keywords.push('delivery')
  data['delivery'] =
    costs: costs
    turns: turns
  data

@HIS.findCellsByThingId = (id) ->
  @HIS.moon.cells.filter (c) -> c.thing.id == id

@HIS.findCellsByKeyword = (keyword) ->
  @HIS.moon.cells.filter (c) ->
    keyword in c.thing.keywords

@HIS.build = (cellId, thingId) ->
  cell = @.state.moon.cells[cellId]
  cell['thing'] = @.data.things[thingId]
  # cell.thing['state'] = cell.thing.initialState
  cell
# Income
  # energy
  # he3
  # bricks
  # aluminum
  # silicon
@HIS.income = ->
  incomeByResource = (keyword) ->
    @HIS.findCellsByKeyword(keyword).map((c) -> c.thing.generator[keyword]).reduce (a, b) -> a + b
  
  {
    energy: incomeByResource('energy')
    he3: incomeByResource('he3')
    bricks: incomeByResource('bricks')
    aluminum: incomeByResource('aluminum')
    silicon: incomeByResource('silicon')
  }
