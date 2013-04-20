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
    
    conversation = getDialogs(0)
    
    unless conversation.guided
        return

    showGuided = (index) =>
        console.log "show guided #{index}"
        if index < conversation.guided.length
            index++
        else
            finish()
            return

        dialog = conversation.guided[index]
        console.log "dialog #{dialog}"
        $("#dialog").html(Handlebars.templates['dialog.hb'](
            advisor : HIS.data.advisors[dialog.advisor],
            message : dialog.message
            )).find(".next").click(()-> showGuided(index+1))

    finish = =>
        $("#dialog").empty()

    showGuided(0)


