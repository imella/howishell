<img src="img/moon.png" style="margin: 26px; width: 648px; height: 575px;">
<div id="moon-areas">
  <div class="row">
    <div class="area-corner"></div>
    {{#each colNumber}}
      <div class="area-column">
        {{this}}
      </div>
    {{/each}}
  </div>
  {{#each rows}}
    <div class="row">
      <div class="area-row">
        <span class="row-number">
          {{rowNumber}}
        </span>
      </div>
      {{#each cells}}
        <div class="area" data-i="{{i}}" data-j="{{j}}">
        </div>
      {{/each}}
    </div>
  {{/each}}
</div>