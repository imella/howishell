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

build = (id, x, y) ->
  # Check if spot is available
  # t =  @HIS.things[id]
  # Check resources
  # Discount resources
  # addEvent (turn, function) 
  #   turn = current + t.build.turns
  #   setInPosition(x, y, t) 
  # setInPosition (x, y, @HIS.things['cs'])

@HIS =
  turn: 0
  events: [] # [{turn: val, function}]
  resources:
    money: 10
    h3: 0
  moon: initializeMoon(12, 8)
  currentDialog:
    guided: ''
    nonGuided: '' # on click

  thingsToSend:
    regular: [] # [{id: val, quantity: val}]
    special: [] # [{name: val, value: val}]
  # TODO: Make a helper Function (HIPSTER CULIAO)
  # Avoid undefined keys (DANIEL CULIAO)
  things:
    'cs':
      id: 'cs'
      name: 'Construction Site'
      image_url: 'construction-site.png'
      keywords: []
    'scv':
      id: 'scv'
      name: 'SCV'
      image_url: 'scv.png'
      keywords: ['robot', 'delivery', 'build']
      delivery: 
        cost: 20
        turns: 1
      build:
        cost: 2
        factoryIds: [2]
        robots: 2
        turns: 1
        bricks: 0
        aluminum: 15
        silicon: 30
    'robot_factory':
      id: 'robot_factory'
      name: 'Robot Factory'
      image_url: 'robot-factory.png'
      keywords: ['factory', 'build', 'maintenance', 'actions']
      build:
        cost: 30
        factoryIds: []
        robots: 2
        turns: 3
        bricks: 100
        aluminum: 150 
        silicon: 50
      maintenance:
        energy: 5
        robots: 0
        bricks: 0
        he3: 0
      actions: [] # [{name: val, function}]
    'drill':
      id: 'drill'
      name: 'Ultra Powerfull Black Scalable Cloud Drill.js'
      image_url: 'drill.png'
      keywords: ['extractor', 'build', 'maintenance', 'generator']
      build:
        cost: 10
        factoryIds: []
        robots: 1
        turns: 2
        bricks: 0
        aluminum: 0 
        silicon: 0
      maintenance:
        energy: 12
        robots: 1
        bricks: 0
        he3: 0
      generator:
        energy: 0
        he3: 0
        bricks: 20
        aluminum: 0
        silicon: 0
      'small_silo':
        id: 'small_silo'
        name: 'Small Silo x23'
        image_url: 'x23.png'
        keywords: ['container', 'build', 'maintenance']
        build:
          cost: 0
          factoryIds: []
          robots: 4
          turns: 2
          bricks: 100
          aluminum: 0 
          silicon: 0
        maintenance:
          energy: 1
          robots: 0
          bricks: 0
          he3: 0
        container:
          storage: 200
          contains: 'resources'

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
