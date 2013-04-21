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
      <div class="area center" data-i="{{i}}" data-j="{{j}}">
        {{#if area.thing}}
          <i class="icon icon-4x {{area.thing.image_url}}"></i>
        {{/if}}
      </div>
    {{/each}}
  </div>
{{/each}}