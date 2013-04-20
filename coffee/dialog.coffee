createRexDialog = ->
	["I think that some solar pannels are a paramount important for operations on the moon, let's buid some"]

createYrionDialog = ->
	["First of all we need a place to stay, "]

createJakeDialog = ->
	["Safety first my fellow cityzen, let's add a "]

createWalloDialogs = ->
	["The most important always will be science, let's add a new research facility."]

createTelescopeDialogs = ->
	[" If we want to find life elsewhere, let's build a telescope and inspect the universe."]

createDialogs = ->
	if @HIS.turn is 0
		@HIS.currentDialog.guided = [ 
			{author: 'jake', message: 'Welcome onboard!!'}
			{author: 'jake', message: 'Let us introduce ourselves.'}
			{author: 'jake', message: "I'm #{@HIS.advisors.jake.name}, #{@HIS.advisors.jake.specialty}."}
			{author: 'rex_charger', message: "I'm #{@HIS.advisors.rex_charger.name}, #{@HIS.advisors.rex_charger.specialty}."}
			{author: 'dr_yrion', message: "I'm #{@HIS.advisors.dr_yrion.name}, #{@HIS.advisors.dr_yrion.specialty}."}
			{author: 'col_telescope', message: "I'm #{@HIS.advisors.col_telescope.name}, #{@HIS.advisors.col_telescope.specialty}."}
			{author: 'dr_wallo', message: "And finally I'm #{@HIS.advisors.dr_wallo.name}, #{@HIS.advisors.dr_wallo.specialty}."}
			{author: 'dr_wallo', message: "We all are going to help you on your journey bootstrapping space industry in the moon."}
			{author: 'col_telescope', message: "You will be responsible of all the operations, buiding and budget currently ongoing."}
			{author: 'dr_yrion', message: "The last person in your charge was removed from its position, cause he made wrong decitions wich ended in an unhabitable, energy-less and unsustainable environment."}
			{author: 'rex_charger', message: "The operation must go on and a delivery is already scheduled for tomorrow morning."}
			{author: 'jake', message: "We expect you to purchase and send the necesary equipment to start your operations."}
			{author: 'jake', message: "We will be meeting soon to discuss about your decitions."}
			{author: 'jake', message: "Let's proceed with the budget!"}
		] 
	else if @HIS.turn is 1
		@HIS.currentDialog.guided = [
			{author: 'jake', message: "Well done!"}
			{author: 'jake', message: "From now on, we will expect you to lead the conversation."}
			{author: 'dr_wallo', message: "We will be here to help you, on whatever goal you think it's the best for the moon."}
			{author: 'dr_yrion', message: "Everyone of us has its own idea of what it's best, but the final decition it's up to you."}
		]
		@HIS.currentDialog.nonGuided = 
			'rex_charger': createRexDialog()
			'dr_yrion': createYrionDialog()
			'jake': createJakeDialog()
			'dr_wallo': createWalloDialogs()
			'col_telescope': createTelescopeDialogs()
		