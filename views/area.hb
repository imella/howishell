<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h3>Area {{i}} - {{j}}</h3>
  <div class="row-fluid">
    {{#with area.resourceDensity}}
    <div class="span3 center">
      <strong>Rock</strong>
      <br>
      <input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{rock}}">
    </div>
    <div class="span3 center">
      <strong>Alumina</strong>
      <br>
      <input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{alumina}}">
    </div>
    <div class="span3 center">
      <strong>Silica</strong>
      <br>
      <input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{silica}}">
    </div>
    <div class="span3 center">
      <strong><sup>3</sup>He</strong>
      <br>
      <input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{he3}}">
    </div>
    {{/with}}
  </div>
  <h4>Available to place</h4>
    <div class="row-fluid">
      {{#each placeable}}
        <div class="span3 well center placeable pointer" data-id="{{thing.id}}"
          data-quantity="{{quantity}}">
          <i class="icon {{thing.image_url}}"></i>
          <strong>{{thing.name}}</strong>
          <br>
          <strong>x {{quantity}}</strong>
        </div>
      {{/each}}
    </div>
  <h4>Buildings</h4>
</div>
<div class="modal-body">
  {{#if area.thing}}
    {{#with area.thing}}
      <div class="switch" data-on="success" data-off="warning">
          <input type="checkbox" checked />
      </div>
    {{/with}}
  {{else}}
    <table id="buildings" class="table table-hover table-striped">
      <tbody>
        {{#each buildings}}
          <tr class="building pointer" data-id="{{id}}">
            <td class="center">
              <i class="icon icon-4x {{image_url}}"></i>
              <br>
              <br>
              <strong>{{name}}</strong>
            </td>
            <td>
              <strong>Cost:</strong>
              <br>
              {{#if build}}
                {{#with build}}
                  <span class="label label-important">$ {{costs}}</span>
                  <span class="label label-important">{{robots}} SCV</span>
                  <span class="label label-important">{{turns}} Turns</span>
                  <span class="label label-important">{{bricks}} Bricks</span>
                  <span class="label label-important">{{aluminum}} Al</span>
                  <span class="label label-important">{{silicon}} Silica</span>
                {{/with}}
              {{/if}}
            </td>
            <td>
              {{#if maintenance}}
                <strong>Maintenance:</strong>
                <br>
                {{#with maintenance}}
                  <span class="label label-warning">{{energy}} mW</span>
                  <span class="label label-warning">{{robots}} SCV</span>
                  <span class="label label-warning">{{he3}} <sup>3</sup>He</span>
                {{/with}}
              {{/if}}
            </td>
            <td>
              {{#if generator}}
                <strong>Generation:</strong>
                <br>
                {{#with generator}}
                  <span class="label label-success">{{energy}} mW</span>
                  <span class="label label-success">{{bricks}} Bricks</span>
                  <span class="label label-success">{{aluminum}} Al</span>
                  <span class="label label-success">{{silicon}} Si</span>
                  <span class="label label-success">{{he3}} <sup>3</sup>He</span>
                  <span class="label label-success">{{storage}} kg</span>
                {{/with}}
              {{/if}}
            </td>
          </tr>
        {{/each}}
      </tbody>
    </table>
  {{/if}}
</div>
<div class="modal-footer">
</div>