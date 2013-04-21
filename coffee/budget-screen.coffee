
$ ->
    
    HIS.state.budget.regular = initialAvailableToPlace()

    $("#screen-budget").on('click', '.deliverable .icon-plus', () ->
        id = $(this).parents('.deliverable').data('id')

        price = HIS.data.things[id].delivery.costs
        item = HIS.state.budget.regular[id]

        if HIS.state.currentBudget.deliverables + price <= HIS.state.resources.money
            HIS.state.currentBudget.deliverables += price
            item.quantity++
        else
            alert "not enough budget to create #{HIS.data.things[id].name}"


        $('#screen-budget .total').text(HIS.state.currentBudget.deliverables)
        $('#screen-budget .deliverables[data-id="#{id}"] .amount').text(item.quantity)
        $('#screen-budget .deliverables[data-id="#{id}"] .total-cost').text(item.quantity*price)

    )

    $("#screen-budget").on('click', '.deliverable .icon-minus', () ->
        id = $(this).parents('.deliverable').data('id')

        price = HIS.data.things[id].delivery.costs
        item = HIS.state.budget.regular[id]

        if item.quantity > 1
            HIS.state.currentBudget.deliverables += price
            item.quantity--

        $('#screen-budget .total').text(HIS.state.currentBudget.deliverables)
        $('#screen-budget .deliverables[data-id="#{id}"] .amount').text(item.quantity)
        $('#screen-budget .deliverables[data-id="#{id}"] .total-cost').text(item.quantity*price)
    )

    HIS.beforeBudgetListener.push(fillBudget)
    HIS.beforeMoonListener.push(processBudget)    


fillBudget = () ->
    
    HIS.state.currentBudget =
        specials : 0
        deliverables : 0

    for key, item of HIS.state.special
        HIS.state.currentBudget.specials += item.value

    context =
        special : HIS.state.special
        deliverables : (item for key, item of HIS.data.things when 'delivery' in item.keywords)
        total : 0

    $("#screen-budget").html(Handlebars.templates['budget-table.hb'](context))


processBudget = () ->
    
    HIS.state.resources.money -= HIS.state.currentBudget.deliverables