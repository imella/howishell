<h3 class="center">Area {{i}} - {{j}}</h3>
<div class="center">
  {{#with area.resourceDensity}}
    <strong>Rock</strong>
    <br>
    <input class="knob" data-step="0.1" data-min="0" data-max="1"
      data-skin="tron" data-readOnly="true" data-thickness=".2"
      data-width="95" data-height="95"
      data-displayPrevious=true value="{{rock}}">
    <br>
    <br>
    <strong>Alumina</strong>
    <br>
    <input class="knob" data-step="0.1" data-min="0" data-max="1"
      data-skin="tron" data-readOnly="true" data-thickness=".2"
      data-width="95" data-height="95"
      data-displayPrevious=true value="{{alumina}}">
    <br>
    <br>
    <strong>Silica</strong>
    <br>
    <input class="knob" data-step="0.1" data-min="0" data-max="1"
      data-skin="tron" data-readOnly="true" data-thickness=".2"
      data-width="95" data-height="95"
      data-displayPrevious=true value="{{silica}}">
    <br>
    <br>
    <strong><sup>3</sup>He</strong>
    <br>
    <input class="knob" data-step="0.1" data-min="0" data-max="1"
      data-skin="tron" data-readOnly="true" data-thickness=".2"
      data-width="95" data-height="95"
      data-displayPrevious=true value="{{he3}}">
  {{/with}}
</div>