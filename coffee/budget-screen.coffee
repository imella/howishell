
$ ->
    HIS.beforeBudgetListener.push(fillBudget)

fillBudget = () ->
    context =
        special : HIS.state.special
        deliverables : (item for key, item of HIS.data.things when item.keywords? && 'delivery' in item.keywords)

    $("#screen-budget").html(Handlebars.templates['budget-table.hb'](context))

