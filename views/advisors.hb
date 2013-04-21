
<div style="text-align: center">
  {{#each advisors}}
  <div class="advisor" data-id="{{id}}" >
    <div class="row"><img draggable='false' src="img/avatar_{{id}}.png" /></div>
    <div class="row" title="{{specialty}}">{{name}}</div>
  </div>
  {{/each}}
  
</div>