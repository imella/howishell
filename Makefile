.PHONY: clean compile

APP=js/app.js
TEMPLATES=js/templates.js

compile: $(APP) $(TEMPLATES)

$(APP): coffee/*.coffee
	coffee --compile --join $@ $^

$(TEMPLATES): views/*.hb
	handlebars --output $@ $^

clean:
	rm -f $(APP) $(TEMPLATES)
