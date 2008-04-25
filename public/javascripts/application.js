
var rules = {
  '#site_selector': function(element){
    $(element).addEvent('change', function(){
      if (this.value == null || this.value == "") return;
      document.location = "/campaigns/show/" + this.value;
    });
  }
}

EventTriggers.register(rules);