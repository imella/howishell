
#####################
# MACHINES          #
#####################
@HIS.data.things.scv = @HIS.deliveryDef(20,
    @HIS.buildDef(2, ['robotFactory'], 2, 1, 0, 15, 30, 
      @HIS.dataDef('scv', 'SCV', 'icon-wrench', ['robot'])
    )
  )

@HIS.data.things.vacuum = @HIS.deliveryDef(50, 
    @HIS.maintenanceDef(1, 0, 0,
      @HIS.generatorDef(0, 3, 0, 0, 0, 0,
        @HIS.dataDef('vacuum', 'Lunar Vacuum', 'icon-wrench', ['energy', 'he3'])
      )
    )
  )

@HIS.data.things.bulldozer = @HIS.deliveryDef(200,
    @HIS.maintenanceDef(13, 0, 0,
      @HIS.generatorDef(0, 13, 0, 0, 0, 0,
        @HIS.dataDef('bulldozer', 'Bulldozer', 'icon-road', ['energy', 'he3'])
      )
    )
  )


#####################
# EXTRACTORS        #
#####################
@HIS.data.things.he3Extractor = @HIS.buildDef(50, ['advancedPrinter'], 8, 4, 0, 100, 300,
    @HIS.maintenanceDef(3, 4, 0,
      @HIS.generatorDef(0, 100, 0, 0, 0, 0,
        @HIS.dataDef('he3Extractor', 'He3 Extractor', 'icon-print', ['energy', 'he3', 'robots'])
      )
    )
  )

@HIS.data.things.drill = @HIS.buildDef(10, [], 1, 2, 0, 0, 0,
    @HIS.maintenanceDef(12, 1, 0,
      @HIS.generatorDef(0, 0, 20, 0, 0, 0,
        @HIS.dataDef('drill', 'Super Drill', 'icon-pushpin', ['drill', 'bricks', 'energy', 'robots'])
      )
    )
  )

@HIS.data.things.aluminumExtractor = @HIS.buildDef(20, ['basicPrinter'], 4, 3, 100, 0, 0,
    @HIS.maintenanceDef(50, 5, 0,
      @HIS.generatorDef(0, 0, 0, 3, 0, 0,
        @HIS.dataDef('aluminumExtractor', 'Aluminum Extractor', 'icon-paper-clip', ['energy', 'aluminum', 'robots'])
      )
    )
  )

@HIS.data.things.siliconExtractor = @HIS.buildDef(20, ['basicPrinter'], 3, 4, 200, 0, 0, 
    @HIS.maintenanceDef(20, 8, 0, 
      @HIS.generatorDef(0, 0, 0, 0, 6, 0,
        @HIS.dataDef('siliconExtractor', 'Silicon Extractor', 'icon-magnet', ['energy', 'silicon', 'robots'])
      )
    )
  )

@HIS.data.things.waterExtractor = @HIS.buildDef(100, ['advancedPrinter'], 12, 8, 100, 150, 500, 
    @HIS.maintenanceDef(10, 3, 0,
      @HIS.dataDef('waterExtractor', 'Water Extractor', 'icon-leaf', ['energy', 'robots'])
    )
  )

#####################
# ENERGY            #
#####################
@HIS.data.things.fusionEnergy = @HIS.buildDef(500, ['advancedPrinter'], 9, 5, 600, 100, 112,
    @HIS.maintenanceDef(0, 10, 5,
      @HIS.generatorDef(1000, 0, 0, 0, 0, 0,
        @HIS.dataDef('fusionEnergy', 'He3 Thermo-Nuclear Fusion Reactor', 'icon-fire', ['energy', 'robots', 'he3'])
      )
    )
  )

@HIS.data.things.solarEnergy = @HIS.deliveryDef(100,
    @HIS.buildDef(30, [], 5, 2, 0, 50, 100,
      @HIS.maintenanceDef(0, 5, 0,
        @HIS.generatorDef(150, 0, 0, 0, 0, 0,
          @HIS.dataDef('solarEnergy', 'Solar Energy Panel', 'icon-certificate', ['energy', 'robots'])
        )
      )
    )
  )

@HIS.data.things.battery = @HIS.deliveryDef(20,
  @HIS.generatorDef(10, 0, 0, 0, 0, 0,
      @HIS.dataDef('battery', 'Battery', 'icon-lemon', ['energy'])
    )
  )

#####################
# FACTORIES         #
#####################
@HIS.data.things.robotFactory = @HIS.buildDef(30, [], 2, 3, 100, 150, 50,
    @HIS.maintenanceDef(5, 0, 0,
      @HIS.dataDef('robotFactory', 'Robot Factory', 'icon-cogs', ['factory', 'energy'])
    )
  )

@HIS.data.things.basicPrinter = @HIS.buildDef(100, [], 3, 3, 0, 0, 0,
    @HIS.maintenanceDef(15, 5, 0,
      @HIS.dataDef('basicPrinter', 'Basic 3D Printer', 'icon-print', ['factory', 'energy', 'robots'])
    )
  )

@HIS.data.things.advancedPrinter = @HIS.buildDef(100, ['basicPrinter'], 7, 5, 300, 350, 250,
    @HIS.maintenanceDef(30, 10, 0,
      @HIS.dataDef('advancedPrinter', 'Advanced 3D Printer', 'icon-print', ['factory', 'energy', 'robots'])
    )
  )

#####################
# COMMUNICATIONS    #
#####################
@HIS.data.things.greatAntenna = @HIS.buildDef(1000, ['advancedPrinter'], 15, 7, 0, 500, 300,
    @HIS.maintenanceDef(30, 0, 0,
      @HIS.dataDef('greatAntenna', 'Great Antenna', 'icon-rss', ['communication', 'energy'])
    )
  )

@HIS.data.things.telescope = @HIS.buildDef(100, ['basicPrinter'], 2, 2, 130, 220, 170,
    @HIS.maintenanceDef(3, 0, 0,
      @HIS.dataDef('telescope', 'Telescope', 'icon-search', ['communication', 'energy'])
    )
  )


#####################
# Defense           #
#####################
@HIS.data.things.laser = @HIS.buildDef(500, ['advancedPrinter'], 10, 5, 0, 0, 0,
    @HIS.maintenanceDef(1000, 15, 0,
      @HIS.dataDef('laser', 'Tactical High Energy Laser', 'icon-fighter-jet', ['defense', 'energy', 'robots'])
    )
  )

@HIS.data.things.shield = @HIS.buildDef(100, ['laser'], 10, 15, 0, 0, 0,
    @HIS.maintenanceDef(1000, 20, 0,
      @HIS.dataDef('shield', 'Meteor Defense Shield', 'icon-minus-sign', ['defense', 'energy', 'robots'])
    )
  )

#####################
# SILOS             #
#####################
@HIS.data.things.smallSilo = @HIS.buildDef(0, [], 0, 1, 100, 0, 0,
    @HIS.maintenanceDef(1, 10, 0,
      @HIS.generatorDef(0, 0, 0, 0, 0, 200,
        @HIS.dataDef('smallSilo', 'Small Silo', 'icon-building', ['silo', 'energy', 'robots', 'storage'])
      )
    )
  )

@HIS.data.things.mediumSilo = @HIS.buildDef(0, [], 0, 2, 200, 0, 0,
    @HIS.maintenanceDef(1, 20, 0,
      @HIS.generatorDef(0, 0, 0, 0, 0, 500,
        @HIS.dataDef('mediumSilo', 'Medium Silo', 'icon-building', ['silo', 'energy', 'robots', 'storage'])
      )
    )
  )

@HIS.data.things.bigSilo = @HIS.buildDef(0, [], 0, 3, 300, 0, 0,
    @HIS.maintenanceDef(1, 30, 0,
      @HIS.generatorDef(0, 0, 0, 0, 0, 800,
        @HIS.dataDef('bigSilo', 'Big Silo', 'icon-building', ['silo', 'energy', 'robots', 'storage'])
      )
    )
  )

@HIS.data.things.monkeys = @HIS.buildDef(500, ['waterExtractor'], 0, 3, 0, 0, 0,
    @HIS.maintenanceDef(100, 0, 0,
      @HIS.dataDef('monkeys', 'Monkey Bio-Dome', 'icon-home', ['silo', 'energy'])
    )
  )

@HIS.data.things.humans = @HIS.buildDef(800, ['waterExtractor'], 0, 4, 0, 0, 0,
    @HIS.maintenanceDef(500, 0, 0,
      @HIS.dataDef('humans', 'Human Bio-Dome', 'icon-home', ['silo', 'energy'])
    )
  )

@HIS.data.constants =
  money: "MUSD"

# @HIS.dataDefinitionHelperBuilding('scv', 2, [2], 2, 1, 0, 15, 30)

# 'scv':
    #   id: 'scv'
    #   name: 'SCV'
    #   image_url: 'icon-wrench'
    #   keywords: ['robot', 'delivery', 'build']
    #   delivery: 
    #     cost: 20
    #     turns: 1
    #   build:
    #     cost: 2
    #     factoryIds: [2]
    #     robots: 2
    #     turns: 1
    #     bricks: 0
    #     aluminum: 15
    #     silicon: 30
    # 'robot_factory':
    #   id: 'robot_factory'
    #   name: 'Robot Factory'
    #   image_url: 'robot-factory.png'
    #   keywords: ['factory', 'build', 'maintenance', 'actions']
    #   build:
    #     cost: 30
    #     factoryIds: []
    #     robots: 2
    #     turns: 3
    #     bricks: 100
    #     aluminum: 150 
    #     silicon: 50
    #   maintenance:
    #     energy: 5
    #     robots: 0
    #     bricks: 0
    #     he3: 0
    #   actions: [] # [{name: val, function}]
    # 'drill':
    #   id: 'drill'
    #   name: 'Ultra Powerfull Black Scalable Cloud Drill.js'
    #   image_url: 'icon-wrench'
    #   keywords: ['extractor', 'build', 'maintenance', 'generator']
    #   build:
    #     cost: 10
    #     factoryIds: []
    #     robots: 1
    #     turns: 2
    #     bricks: 0
    #     aluminum: 0 
    #     silicon: 0
    #   maintenance:
    #     energy: 12
    #     robots: 1
    #     bricks: 0
    #     he3: 0
    #   generator:
    #     energy: 0
    #     he3: 0
    #     bricks: 20
    #     aluminum: 0
    #     silicon: 0
    #   'small_silo':
    #     id: 'small_silo'
    #     name: 'Small Silo x23'
    #     image_url: 'icon-wrench'
    #     keywords: ['container', 'build', 'maintenance']
    #     build:
    #       cost: 0
    #       factoryIds: []
    #       robots: 4
    #       turns: 2
    #       bricks: 100
    #       aluminum: 0 
    #       silicon: 0
    #     maintenance:
    #       energy: 1
    #       robots: 0
    #       bricks: 0
    #       he3: 0
    #     container:
    #       storage: 200
    #       contains: 'resources'