createRexDialog = ->
	message = []
	if @HIS.findCellsByThingId('vacuum').size is 0
		message.push "I think that a #{@HIS.data.things.vacuum.name} could help us start the He3 harvest."
	
	if @HIS.findCellsByThingId('bulldozer').size is 0 and @HIS.state.turn > 10
		message.push "I think that a #{@HIS.data.things.bulldozer.name} could greately improve our He3 income."
	
	if @HIS.income().energy.gross <= 0
		message.push "Energy situation on the moon is critical, We need energy now, send batteries."
		
	message

createYrionDialog = ->
	message = []
	if @HIS.state.turn < 10
		message.push "We need more money to begin our research on colonization."
	
	if @HIS.findCellsByThingId('h2o').size is 0
		message.push "In order to populate the moon, we need water."
		if @HIS.findCellsByThingId('printer1').size is 0
			message.push "To create the water refinery, we need to create a #{@HIS.data.things.printer1.name}."
		else
			if @HIS.findCellsByThingId('printer2').size is 0 
				message.push "We need a more advanced printer to build the H2O refinery."
	else
		if @HIS.findCellsByThingId('monkeys').size is 0 
			if @HIS.resources.money < @HIS.data.things.monkeys.delivery.costs * 0.2
				message.push " In order to send the monkeys, we need more money"
			else if @HIS.resources.money < @HIS.data.things.monkeys.delivery.costs * 0.8
				message.push "We are close to send the monkeys, but we need a little more money"
			else 
				message.push "Now that we have the money, let's build the #{@HIS.data.things.monkeys.name} dome."
		else
			message.push "Our final step is ahead of as, let's build the #{@HIS.data.things.monkeys.name} dome."
	message


#  La funcion de jake es ser un contratista del gobierno de la tierra,
#  entrega misiones que debes cumplir en cierto tiempo.
#  primero busca instalar un laser que require mucha energia y muchos robots.
#  Luego quiere instalar un meteor defence shield
#  Cada vez que logra un objetivo, recibirá mucho dinero.
createJakeDialog = ->
	message = []
	if @HIS.state.turn < 5
		message.push "I'm currently on the final state of contract negociations, give me some time and I will close the deal."
	else if @HIS.state.turn < 8
		message.push "We are almost ready with the contract. We will need a big energy input. Consider building a #{@HIS.data.things.fusion.name}."
	else if @HIS.state.turn < 12 
		message.push "We are going to build a laser."
		message.push "We will be needing many robots for its maintenance and a lot of cash."
	else if @HIS.state.turn is 15
		@HIS.state.firstJakeQuestCompleted = false
		message.push "I'm very exited to tell you that we got that contract."
		message.push "If we build the #{@HIS.data.things.laser.name}, the earth goverment is going to pay us 2000 credits."
		message.push "The ugly part is that we only have 5 turns to acomplish this."
		message.push "With your help we can make it!."
	if @HIS.state.turn < 20
		message.push "Hurry up!, we only have till turn 20 to build the #{@HIS.data.things.laser.name}."
	if @HIS.state.turn is 20
		if @HIS.state.firstJakeQuestCompleted
			@HIS.state.resources.money += 2000
			message.push "Excelent job! The earth government has just wired us the credits."
		else
			message.push "You failed, the quest was not completed."
	if @HIS.state.turn is 23
		if @HIS.state.firstJakeQuestCompleted
			message.push "The first quest was great, let's keep doing a amazing job."
			message.push "Get ready for the next quest!"
		else
		  message.push "The first quest was not acomplished, but here you have another opportunity."
			message.push "Get ready for the next quest!"
		message.push "If we build the #{@HIS.data.things.shield.name}, the earth goverment is going to pay us 5000 credits."
		message.push "The ugly part is that we only have 7 turns to acomplish this."

	message

createWalloDialogs = ->
	message = []
	if @HIS.findCellsByThingId('s_silo').size is 0
		message.push "I think that a #{@HIS.data.things.s_silo.name} is nedeed."
	
	message

createTelescopeDialogs = ->
	message = []
	if @HIS.findCellsByThingId('comms').size is 0
		message.push "I think that a #{@HIS.data.things.comms.name} is nedeed."
	
	if @HIS.state.turn is 5
		message.push "I think that a #{@HIS.data.things.comms.name} is nedeed."
	message

getDialogs = ->
	guided = []
	nonGuided = {}

	switch @HIS.state.turn
		when 0
			guided = [
				{author: 'jake', message: 'Welcome onboard!!'}
				{author: 'jake', message: 'Let us introduce ourselves.'}
				{author: 'jake', message: "I'm #{@HIS.data.advisors.jake.name}, #{@HIS.data.advisors.jake.specialty}."}
				{author: 'rex_charger', message: "I'm #{@HIS.data.advisors.rex_charger.name}, #{@HIS.data.advisors.rex_charger.specialty}."}
				{author: 'dr_yrion', message: "I'm #{@HIS.data.advisors.dr_yrion.name}, #{@HIS.data.advisors.dr_yrion.specialty}."}
				{author: 'col_telescope', message: "I'm #{@HIS.data.advisors.col_telescope.name}, #{@HIS.data.advisors.col_telescope.specialty}."}
				{author: 'dr_wallo', message: "And finally I'm #{@HIS.data.advisors.dr_wallo.name}, #{@HIS.data.advisors.dr_wallo.specialty}."}
				{author: 'dr_wallo', message: "We all are going to help you on your journey bootstrapping space industry in the moon."}
				{author: 'col_telescope', message: "You will be responsible of all the operations, buiding and budget currently ongoing."}
				{author: 'dr_yrion', message: "The last person in your charge was removed from its position, cause he made wrong decitions wich ended in an unhabitable, energy-less and unsustainable environment."}
				{author: 'rex_charger', message: "The operation must go on and a delivery is already scheduled for tomorrow morning."}
				{author: 'jake', message: "We expect you to purchase and send the necesary equipment to start your operations."}
				{author: 'jake', message: "We will be meeting soon to discuss about your decitions."}
				{author: 'jake', message: "Let's proceed with the budget!"}
			]

		when 1
			guided = [
				{author: 'jake', message: "Well done!"}
				{author: 'jake', message: "From now on, we will expect you to lead the conversation."}
				{author: 'dr_wallo', message: "We will be here to help you, on whatever goal you think it's the best for the moon."}
				{author: 'dr_yrion', message: "Everyone of us has its own idea of what it's best, but the final decition it's up to you."}
			]
			nonGuided = 
				'rex_charger': createRexDialog()
				'dr_yrion': createYrionDialog()
				'jake': createJakeDialog()
				'dr_wallo': createWalloDialogs()
				'col_telescope': createTelescopeDialogs()

	return { guided : guided, nonGuided : nonGuided }
