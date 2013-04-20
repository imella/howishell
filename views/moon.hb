<img src="img/moon.png">
<div id="moon-areas">
  {{#each rows}}
  <div class="row">
    {{#each this}}
      <div class="area">
        {{this.name}}
      </div>
    {{/each}}
  </div>
{{/each}}
</div>