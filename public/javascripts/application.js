
var rules = {
  '#site_selector': function(element){
    $(element).addEvent('change', function(){
      if (this.value == null || this.value == "") return;
      document.location = "/campaigns/show/" + this.value;
    });
  },
  
  'input.datepicker': function(element){
    $(element).addEvent('keyup', function(){
      var parsed = Date.parse(this.value);
      var text = $(this.getAttribute('update_text'));
      var field = $(this.getAttribute('update_field'));
      if (parsed != null){
        field.value = parsed.toString("yyyy-MM-dd HH:mm:ss");
        text.innerHTML = parsed.toString("MMMM dd, yyyy");;
        text.removeClass('invalid');
      }else{
        field.value = null;
        text.innerHTML = "N/A";
        text.addClass('invalid');
      }
    });
    $(element).fireEvent('keyup');
  }
}

EventTriggers.register(rules);