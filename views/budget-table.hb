<img src="img/NASA_logo.svg" class="span2">
<table class="table table-striped table-hover">
  <thead>
    <tr>
      <th>Item</th>
      <th>Cantidad</th>
      <th>Costo</th>
      <th>Sub-total</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    {{#each specials}}
    <tr>
      <td>
        <strong>{{name}}</strong>
      </td>
      <td></td>
      <td></td>
      <td>{{total_cost}}</td>
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
    <td colspan="4">Total</td>
    <td class="total">{{total}}</td>
  </tbody>
</table>