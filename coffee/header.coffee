$ ->
    $("#header").html(Handlebars.templates['header.hb'](HIS))


    screen = 'meeting'

    $("#next-btn").click () ->
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
                screen = 'meeting'


        
            
        

