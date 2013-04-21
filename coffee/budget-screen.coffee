
$ ->
    
    HIS.state.budget.regular = initialAvailableToPlace()

    $("#screen-budget").on('click', '.deliverable .add', () ->
        id = $(this).parents('.deliverable').data('id')
        console.log "adding #{id}"

        price = HIS.data.things[id].delivery.costs
        item = HIS.state.budget.regular[id]

        if HIS.state.currentBudget.deliverables + price <= HIS.state.resources.money
            HIS.state.currentBudget.deliverables += price
            item.quantity++
        else
            alert "not enough budget to create #{HIS.data.things[id].name}"


        $('#screen-budget .total').text(HIS.state.currentBudget.deliverables)
        $("#screen-budget .deliverable[data-id='#{id}'] .amount").text(item.quantity)
        $("#screen-budget .deliverable[data-id='#{id}'] .total-cost").text(item.quantity*price)

    )

    $("#screen-budget").on('click', '.deliverable .remove', () ->
        id = $(this).parents('.deliverable').data('id')
        console.log "removing #{id}"

        price = HIS.data.things[id].delivery.costs
        item = HIS.state.budget.regular[id]

        if item.quantity > 0
            HIS.state.currentBudget.deliverables -= price
            item.quantity--

        $('#screen-budget .total').text(HIS.state.currentBudget.deliverables)
        $("#screen-budget .deliverable[data-id='#{id}'] .amount").text(item.quantity)
        $("#screen-budget .deliverable[data-id='#{id}'] .total-cost").text(item.quantity*price)
    )

    HIS.beforeBudgetListener.push(fillBudget)
    HIS.beforeMoonListener.push(processBudget)    


fillBudget = () ->
    
    HIS.state.currentBudget =
        specials : 0
        deliverables : 0

    for key, item of HIS.state.budget.special
        HIS.state.currentBudget.specials += item.value

    context =
        specials : HIS.state.budget.special
        deliverables : (item for key, item of HIS.data.things when 'delivery' in item.keywords)
        total : 0

    $("#screen-budget").html(Handlebars.templates['budget-table.hb'](context))


processBudget = () ->
    
    HIS.state.resources.money -= HIS.state.currentBudget.deliverables