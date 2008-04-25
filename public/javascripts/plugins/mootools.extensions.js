/*------------------------------------------------------------------------------------
  Plugin: Mootools Extentions
  Description: Brings some much needed prototype functions to MooTools
  Author: Prototype team
  Dependencies: mootools.v1.00
------------------------------------------------------------------------------------*/

// Element methods
Element.extend({
	getDimensions: function() {
		return {width: this.getStyle('width', true), height: this.getStyle('height', true)};
	},	
	visible: function() {
		return this.getStyle('display') != 'none';
	},
	toggle: function() {
		return this[this.visible() ? 'hide' : 'show']();
	},
	hide: function() {
		this.originalDisplay = this.style.display; 
		this.style.display = 'none';
		return this;
	},
	show: function(display) {
		this.style.display = display || this.originalDisplay || 'block';
		return this;
	},
	cleanWhitespace: function() {
		$A(this.childNodes).each(function(node){
			if (node.nodeType == 3 && !/\S/.test(node.nodeValue)) node.parentNode.removeChild(node);
		});
	},
	find: function(what) {
		var el = this;
		while (el.nodeType != 1) el = el[what];
		return el;
	},
	replace: function(html) {
		if (this.outerHTML) {
			this.outerHTML = html.stripScripts();
		} else {
			var range = this.ownerDocument.createRange();
			range.selectNodeContents(this);
			this.parentNode.replaceChild(
				range.createContextualFragment(html.stripScripts()), this);
		}
		setTimeout(function() {html.evalScripts()}, 10);
	},
	empty: function() {
		return this.innerHTML.match(/^\s*$/);
	},
	getOffsetHeight: function(){ return this.getStyle('height'); },
	getOffsetWidth: function(){ return this.getStyle('width'); },
	
	positionedOffset: function() {
	  var element = this;
    var valueT = 0, valueL = 0;
    do {
      valueT += element.offsetTop  || 0;
      valueL += element.offsetLeft || 0;
      element = element.offsetParent;
      if (element) {
        p = element.getStyle('position');
        if (p == 'relative' || p == 'absolute') break;
      }
    } while (element);
    return {x:valueL, y:valueT};
  }
});

// String Functions
String.prototype.getAnchor = function() {
  return /#([a-z][\w.:-]*)$/i.exec(this)[1];
}

// Array functions
Object.extend(Array.prototype, {
  first: function(){
    return this[0] || null;
  },
  last: function(){
    return this[this.length -1] || null
  }
})