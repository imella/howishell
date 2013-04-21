<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h3>Area {{i}} - {{j}}</h3>
</div>
<div class="modal-body">
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
  <hr>
  {{#if area.thing}}
    {{#with area.thing}}
    {{/with}}
  {{else}}
    <h4>Prefabrecated</h4>
    {{#each placeable}}
      <table class="table">
        <thead>
          <td></td>
          <td></td>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    {{/each}}
    <hr>
    <h4>Buildings</h4>
    {{#each buildings}}
      <table class="table">
        <thead>
          <tr>
            <th></th>
            <th>Cost</th>
            <th>Mantainance</th>
            <th>Generation</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><i class="icon {{image_url}}"></i>{{name}}</td>
            <td>
              {{#with build}}
                <span class="label label-important">$ {{costs}}</span>
                <span class="label label-important">{{robots}} SCV</span>
                <span class="label label-important">{{turns}} Turns</span>
                <span class="label label-important">{{bricks}} Bricks</span>
                <span class="label label-important">{{aluminum}} Al</span>
                <span class="label label-important">{{silicon}} Silica</span>
              {{/with}}
            </td>
            <td>
              {{#with mantainance}}
                <span class="label label-warning">{{energy}} mW</span>
                <span class="label label-warning">{{robots}} SCV</span>
                <span class="label label-warning">{{he3}} <sup>3</sup>He</span>
              {{/with}}
            </td>
            <td>
              {{#with generator}}
                <span class="label label-success">{{energy}} mW</span>
                <span class="label label-success">{{bricks}} Bricks</span>
                <span class="label label-success">{{aluminum}} Al</span>
                <span class="label label-success">{{silicon}} Si</span>
                <span class="label label-success">{{he3}} <sup>3</sup>He</span>
                <span class="label label-success">{{storage}} kg</span>
              {{/with}}
            </td>
          </tr>
        </tbody>
      </table>
    {{/each}}
  {{/if}}
</div>