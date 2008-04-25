/*------------------------------------------------------------------------------------
  Plugin: EventTriggers
  Description: Behaviour (http://ripcord.co.nz/behaviour/) inspired event triggers
  Author: Kyle Neath
  Dependencies: mootools.v1.00 
------------------------------------------------------------------------------------*/

var EventTriggers = {
	triggers : [],
	
	register : function(sheet){
		this.triggers.push(sheet);
	},
	
	start : function(){
		Window.onDomReady(this.apply.bindAsEventListener(this));
	},
	
	apply : function(){
	  this.triggers.each(function(trigger){
	    for (selector in trigger){
	      var elements = $$(selector);
	      if (!elements) continue;
	      elements.each(function(element){
	        trigger[selector](element);
	      });
	    }
	  });
	}
}

EventTriggers.start();