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
  <h4>Prefabrecated</h4>
  <table class="table">
    <thead>
      <td></td>
      <td></td>
    </thead>
    <tbody>
      {{#each placeable}}
        <tr>
          <td></td>
          <td></td>
        </tr>
      {{/each}}
    </tbody>
  </table>
  <h4>Buildings</h4>
</div>
<div class="modal-body">
  {{#if area.thing}}
    {{#with area.thing}}
    {{/with}}
  {{else}}
    <table id="buildings" class="table table-hover table-striped">
      <tbody>
        {{#each buildings}}
          <tr class="building pointer">
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
  <button id="build-in-area" data-dismiss="modal" aria-hidden="true"
    class="disabled btn btn-large btn-primary">Build</button>
</div>