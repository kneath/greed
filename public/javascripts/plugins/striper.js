/*------------------------------------------------------------------------------------
  Stripe
------------------------------------------------------------------------------------*/

var Striper = function(element, tagName){
  var elements = element.getElementsByTagName(tagName);
  var odd = true;
  for (var j=0; j<elements.length; j++){
    var el = elements[j];
    if (odd) $(el).addClass('odd');
    odd = !odd;
  }
}