$ ->
    HIS.state.turn = 0
    $("#header").html(Handlebars.templates['header.hb'](HIS))
    $("#advisors").html(Handlebars.templates['advisors.hb']( advisors : $.map(HIS.data.advisors, (value, key) -> value) ))

    $("#screen-meeting, #screen-budget, #screen-moon").hide()
    screen = 'meeting'
    $("#screen-meeting").show()
    setupDialog()

    $("#next-btn").click () =>
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
                setupDialog()
                screen = 'meeting'
                HIS.state.turn++

    
    
        
    



setupDialog = ->

    $("#advisors, #advisors .advisor").unbind('click');
    $("#advisor .advisors").popover('destroy')

    showingDialog = false
    conversation = getDialogs()
    console.log conversation

    $("#advisors .advisor").each (idx, avatar)=>
        console.log avatar
        $(avatar).click () =>
            console.log "clicked on #{$(avatar).data('id')} when showingDialog = #{showingDialog}"
            if not showingDialog
                startUnguided($(avatar).data('id'))



    startGuided = () =>
        showingDialog = true

        nextClick = () =>

        onClick = () =>
            nextClick()

        showStep = (index, author) =>
            dialog = conversation.guided[index]

            $("#advisors .advisor").popover('destroy')

            if not dialog 
                $("#advisors").unbind('click')
                showingDialog = false
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

        console.log "asked for help from #{author}"

        nextClick = () =>

        onClick = () =>
            nextClick()

        getText = (index) =>
            dialog[index]

        dialog = conversation.nonGuided[author]

        advisorIcon = $("#advisors .advisor[data-id='#{author}']")
            
        advisorIcon.popover
            animation : false
            title : ''
            content : getText
            placement: 'bottom'
            trigger : 'manual'        

        showStep = (index) =>
            if not dialog 
                $("#advisors .advisor").popover('destroy')
                $("#advisors").unbind('click')
                showingDialog = false
                return

            nextClick = () =>
                showStep(index+1)
            
            advisorIcon.popover('show')            

        $("#advisors").click(onClick)

        showStep(0)

    startGuided()


