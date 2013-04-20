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

    
    
        
    



setupDialog = ->

    $("#advisors, #advisors .advisors").unbind();
    $("#advisor .advisors").popover('destroy')
    
    conversation = getDialogs(0)
        
    startGuided = () =>

        getText = (index) =>
            return conversation.guided[index].message
        

        nextClick = () =>

        onClick = () =>
            nextClick()

        showGuided = (index) =>
            dialog = conversation.guided[index]

            $("#advisors .advisor").popover('destroy')

            if not dialog 
                console.log("finished guided")
                nextClick = () =>
                $("#advisors").unbind('click')
                return

            

            nextClick = () =>
                showGuided(index+1)

            advisorIcon = $("#advisors .advisor[data-id='#{dialog.author}']")
            
            advisorIcon.popover
                animation : false
                title : ''
                content : dialog.message
                placement: 'bottom'
                trigger : 'manual'

            advisorIcon.popover('show')
            

        $("#advisors").click(onClick)
        showGuided(0)


    startGuided()


