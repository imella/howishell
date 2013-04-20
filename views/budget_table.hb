<table class="table">
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
    {{#each special_equipment}}
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

    {{#each budget_items}}
    <tr>
      <td>
        <strong>{{name}}</strong>
      </td>
      <td class="amount">0</td>
      <td>{{unit_cost}}</td>
      <td class="total_cost">0</td>
      <td>
        <a href="#" class="btn">
          <i class="icon icon-plus" data-id="{{id}}"></i>
        </a>
        <a href="#" class="btn">
          <i class="icon icon-minus" data-id="{{id}}"></i>
        </a>
      </td>
    </tr>
    {{/each}}
  <tr>
    <td colspan="4">Total</td>
    <td>{{total}}</td>
  </tbody>
</table>