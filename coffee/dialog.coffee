createRexDialog = ->
	message = []
	if @HIS.findCellsByThingId('vacuum').size is 0
		message.push "I think that a #{@HIS.data.things.vacuum.name} could help us start the He3 harvest."
	
	if @HIS.findCellsByThingId('bulldozer').size is 0 and @HIS.state.turn > 10
		message.push "I think that a #{@HIS.data.things.bulldozer.name} could greately improve our He3 income."
	
	if @HIS.resourceStatus().energy.gross <= 0
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
		message.push "If we build the #{@HIS.data.things.laser.name}, the earth goverment is going to pay us 1000 credits."
		message.push "The ugly part is that we only have 5 turns to acomplish this."
		message.push "With your help we can make it!."
	if @HIS.state.turn < 20
		message.push "Hurry up!, we only have till turn 20 to build the #{@HIS.data.things.laser.name}."
	if @HIS.state.turn is 20
		if @HIS.state.firstJakeQuestCompleted
			@HIS.state.resources.money += 1000
			message.push "Excelent job! The earth government has just wired us the credits."
		else
			message.push "You failed, the quest was not completed."
	
	if @HIS.state.firstJakeQuestCompleted
		if @HIS.state.turn is 23
			message.push "The first quest was great, let's keep doing a amazing job."
			message.push "Get ready for the next quest!"
			@HIS.state.secondJakeQuestCompleted = false
		else if @HIS.state.turn < 26
			message.push "I'm very exited to tell you that we got another contract."
		else if @HIS.state.turn < 29
			message.push "The earth government is very impressed with the results of the last contract."
			message.push "This time if we build the #{@HIS.data.things.shield.name}, they are going to permanently finance our operations."
			message.push "The sake of humanity cannot be left to the dices."
			message.push "Beware that this time we only have 7 turns."
		else if @HIS.state.turn < 36
			message.push "Hurry up!, we only have #{36 - @HIS.state.turn} turns left to build the #{@HIS.data.things.laser.name}."
		else 
			message.push "You failed to build the #{@HIS.data.things.laser.name}. I have nothing else to discuss with you."
	message

# El Dr. Wallo esta encargado de realizar investigación en la luna.
# Woff
createWalloDialogs = ->
	["woff."]


# El Colonel Telescope esta encargado de instalar sitios 
# para poder colocar telescopios y mantenerlos apuntando a distintas direcciones.
# Entrega misiones, pero estas tienen un tiempo mas libre para llevarlas a cabo.
createTelescopeDialogs = ->
	message = []
	currentAntenas = @HIS.findCellsByThingId('comms').size
	expectedAntenas = @HIS.state.turn * 0.15
	if currentAntenas < expectedAntenas
		message.push "We could be receiving signals from outer space right now."
		message.push "Acording to my schedules, we need #{expectedAntenas}, but we currently only have #{currentAntenas}."
		message.push "I think that a #{@HIS.data.things.comms.name} is nedeed."
	else
		message.push "Our outer space exploration is going very good. Nice!"
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
