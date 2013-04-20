<div class="row">
    <div class="span4 pull-left">Turn: {{state.turn}}</div>
    <div class="span2 pull-right">
        <a href="#" class="btn next-btn"> Next <i class="icon icon-arrow-right"></i></a>
    </div>
</div>
<div id="resource-status" class="row" >
    {{#with resources}}

        <div class="span2" title="Energy">
            <i class="resource icon icon-bolt"></i> {{energy.output}}/{{energy.input}} mW
        </div>
        
        {{#with bricks}}
        <div class="span2" title="Bricks">
            <i class="resource icon icon-hdd"></i> 
            {{total}} kg  (+{{input}}/-{{output}})
        </div>
        {{/with}}

        {{#with aluminum}}
        <div class="span2" title="Aluminum">
            <strong class="resource">Al</strong> {{total}} kg
            (+{{input}}/-{{output}})
        </div>
        {{/with}}

        {{#with silicon}}
        <div class="span2" title="Silicone">
            <strong class="resource">Si</strong> {{total}} kg
            (+{{input}}/-{{output}})
        </div>
        {{/with}}

        {{#with he3}}
        <div class="span2" title="Helium-3">
            <strong class="resource"><sup>3</sup>He</strong> {{total}} kg
            (+{{input}}/-{{output}})
        </div>
        {{/with}}
    {{/with}}

    <div class="span2" tilte="Budget">
        <strong class="resource"><i class="icon icon-globe"></i>$</strong> {{state.resources.money}}M
    </div>

</div>