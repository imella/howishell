$ ->
    $("#header").html(Handlebars.templates['header.hb'](HIS))
    $("#advisors").html(Handlebars.templates['advisors.hb']( advisors : $.map(HIS.data.advisors, (value, key) -> value) ))

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



        
            
        

