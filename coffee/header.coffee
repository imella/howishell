$ ->
    HIS.state.turn = 0
    
    $("#advisors").html(Handlebars.templates['advisors.hb']( advisors : $.map(HIS.data.advisors, (value, key) -> value) ))

    $("#screen-meeting, #screen-budget, #screen-moon").hide()
    screen = 'meeting'
    $("#screen-meeting").show()
    setupDialog()
    updateResources()

    $("#next-btn").click () =>
        updateResources()
        $("#screen-meeting, #screen-budget, #screen-moon").hide()
        switch screen
            when 'meeting'
                $("#screen-budget").show()
                screen = 'budget'
            when 'budget'
                $("#screen-moon").show()
                screen = 'moon'
            when 'moon'
                $("#screen-meeting").show()
                HIS.state.turn++
                setupDialog()
                screen = 'meeting'

updateResources = ->

    state = HIS.resourceStatus()
    context = {status: HIS.resourceStatus(), money: HIS.state.resources.money}
    $("#header").html(Handlebars.templates['header.hb'](context))
    



setupDialog = ->

    $("#advisors, #advisors .advisor").unbind('click')
    $("#advisor .advisor").removeClass('idle').popover('destroy')
    $("#advisor").off('click')

    conversation = getDialogs()
    console.log conversation.nonGuided

    $('#advisors .advisor').on('click', (e) ->
        if $(e.currentTarget).hasClass('idle')
            e.stopPropagation()
            startUnguided($(this).data('id'))
    )


    startGuided = () =>
        $("#advisor .advisor").removeClass('idle')

        nextClick = () =>

        onClick = () =>
            nextClick()

        showStep = (index, author) =>
            dialog = conversation.guided[index]

            $("#advisors .advisor").popover('destroy')

            if not dialog 
                $("#advisors").unbind('click')
                $("#advisors .advisor").addClass('idle')
                return

            

            nextClick = () =>
                showStep(index+1)

            advisorIcon = $("#advisors .advisor[data-id='#{dialog.author}']")
            
            advisorIcon.popover
                animation : false
                title : ''
                content : dialog.message
                placement: 'bottom'
                trigger : 'manual'

            advisorIcon.popover('show')
            

        $("#advisors").click(onClick)
        showStep(0)
 
    startUnguided = (author) =>
        $("#advisors .advisor").removeClass('idle')
        console.log "asked for help from #{author}"

        dialog = conversation.nonGuided[author] || [ "I've got no counsel for now" ]

        nextClick = () =>

        onClick = (e) =>
            nextClick()


        advisorIcon = $("#advisors .advisor[data-id='#{author}']")            

        showStep = (index) =>

            $("#advisors .advisor").popover('destroy')
            
            message = dialog[index]
            console.log "#{author}:#{index} '#{message}'"

            if not message
                $("#advisors").unbind('click')
                $("#advisors .advisor").addClass("idle")
                return

            nextClick = () =>
                showStep(index+1)
            
            advisorIcon.popover
                animation : false
                title : ''
                content : message
                placement: 'bottom'
                trigger : 'manual'        

            advisorIcon.popover('show')            

        showStep(0)

        $("#advisors").click(onClick)

    startGuided()


