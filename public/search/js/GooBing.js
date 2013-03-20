var GooBing = function(){

      var f, 
          resultscontainer, 
          send, 
          q;
        
      function init() {

          f    = document.getElementById('mainform')
          q    = document.getElementById('search')

          if(f && q) {

             GooBing.addEvent(f, 'submit', GooBing.get, false)
          }
      }

      function get( e ) {

          e.preventDefault()
          e.stopPropagation()

          var searchterm = q.value;

          window.location = 'http://' + window.location.host + '/search/' + searchterm
      }

      function addEvent(elem, evType, fn, useCapture) {
 
          if(elem.addEventListener) {
            return elem.addEventListener(evType, fn, useCapture) 
          } else if(elem.attachEvent) {
            return elem.attachEvent('on'+evType,fn)
          } else {
            elem['on'+evType] = fn
          }
      }

      return {init: init, get: get, addEvent: addEvent}
}();

GooBing.init();