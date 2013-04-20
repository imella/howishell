<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
  <h3>Area {{i}} - {{j}}</h3>
</div>
<div class="modal-body">
  {{#with area.resourceDensity}}
    <h4>Resource Density</h4>
    <dl class="dl-horizontal">
      <dt>Rock</dt>
      <dd><input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{rock}}"></dd>
      <dt>Alumina</dt>
      <dd><input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{alumina}}"></dd>
      <dt>Silica</dt>
      <dd><input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{silica}}"></dd>
      <dt><sup>3</sup>He</dt>
      <dd><input class="knob" data-step="0.1" data-min="0" data-max="1"
        data-skin="tron" data-readOnly="true" data-thickness=".2"
        data-width="75" data-height="75"
        data-displayPrevious=true value="{{he3}}"></dd>
    </dl>
  {{/with}}
</div>