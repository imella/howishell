<h3 class="center">Resources</h3>
<div id="resource-status" class="center" >
    {{#with resources}}

        <div class="center" title="Energy">
            <i class="icon icon-bolt"></i>
            <span class="label label-inverse">
                {{energy.output}}/{{energy.input}} mW
            </span>
        </div>
        <br>
        <br>
        {{#with bricks}}
        <div class="center" title="Bricks">
            <i class="resource icon icon-hdd"></i>
            <span class="label label-inverse">
             {{total}} kg  (+{{input}}/-{{output}})
            </span>
        </div>
        {{/with}}
        <br>
        <br>
        {{#with aluminum}}
        <div class="center" title="Aluminum">
            <strong class="resource">Al</strong>
            <span class="label label-inverse">
                {{total}} kg
                (+{{input}}/-{{output}})
            </span>
        </div>
        {{/with}}
        <br>
        <br>
        {{#with silicon}}
        <div class="center" title="Silicone">
            <strong class="resource">Si</strong>
            <span class="label label-inverse">
            {{total}} kg
            (+{{input}}/-{{output}})
            </span>
        </div>
        {{/with}}
        <br>
        <br>
        {{#with he3}}
        <div class="center" title="Helium-3">
            <strong class="resource"><sup>3</sup>He</strong>
            <span class="label label-inverse">
                {{total}} kg
            (+{{input}}/-{{output}})
            </span>
        </div>
        {{/with}}
    {{/with}}
    <br>
    <br>
    <div class="center" tilte="Budget">
        <strong class="resource"><i class="icon icon-globe"></i>$</strong>
        <span class="label label-inverse">
            {{state.resources.money}}M
        </span>
    </div>

</div>