@HIS.data.things.scv = @HIS.deliveryDef(20, 1,
  @HIS.buildDef(2, [2], 2, 1, 0, 15, 30, 
    @HIS.dataDef('scv', 'SCV', 'scv.url', ['robot']))
)


# @HIS.dataDefinitionHelperBuilding('scv', 2, [2], 2, 1, 0, 15, 30)

# 'scv':
    #   id: 'scv'
    #   name: 'SCV'
    #   image_url: 'scv.png'
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
    #   image_url: 'drill.png'
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
    #     image_url: 'x23.png'
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