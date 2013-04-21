<img src="img/NASA_logo.svg" class="span2">
<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Item</th>
      <th>Amount</th>
      <th>Cost</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    {{#each specials}}
    <tr>
      <td colspan="2">
        <strong>{{name}}</strong>
      </td>
      <td>{{value}}</td>
      <td></td>
      <td></td>
    </tr>
    {{/each}}

    {{#each deliverables}}
    <tr class="deliverable" data-id="{{id}}">
      <td>
        <strong>{{name}}</strong>
      </td>
      <td class="amount">0</td>
      <td>{{delivery.costs}}</td>
      <td class="total-cost">0</td>
      <td>
        <a href="#" class="btn add">
          <i class="icon icon-plus"></i>
        </a>
        <a href="#" class="btn remove">
          <i class="icon icon-minus""></i>
        </a>
      </td>
    </tr>
    {{/each}}
  <tr>
    <td colspan="3"><span class="pull-right" >TOTAL</span></td>
    <td colspan="2" class="total">{{total}}</td>
  </tbody>
</table>