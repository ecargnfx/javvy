var cards = document.getElementsByClassName('card');

for (var i=0; i<cards.length; i++) {
  cards[i].addEventListener('click', openModal);
}

function openModal() {
  var modal = document.getElementById("modal-id");
  var close = modal.querySelectorAll('[aria-label="Close"]');
  modal.classList.add("active");
  for (var i=0; i<close.length; i++) {
    close[i].addEventListener('click', closeModal);
  }
  function closeModal() {
    modal.classList.remove("active");
  }
}

// Default SortableJS
import Sortable from 'sortablejs';

  var brainstorm1 = document.getElementById('brainstorm-1'),
      brainstorm2 = document.getElementById('brainstorm-2'),
      brainstorm3 = document.getElementById('brainstorm-3'),
      brainstorm4 = document.getElementById('brainstorm-4'),
      assumption1 = document.getElementById('assumption-1'),
      assumption2 = document.getElementById('assumption-2');

  new Sortable(assumption1, {
    group: {
        name: 'shared',
        pull: 'clone' // To clone: set pull to 'clone'
    },
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

  new Sortable(assumption2, {
    group: {
        name: 'shared',
        pull: 'clone' // To clone: set pull to 'clone'
    },
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

  new Sortable(brainstorm1, {
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

  new Sortable(brainstorm2, {
    group: {
        name: 'shared',
        pull: 'clone' // To clone: set pull to 'clone'
    },
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

  new Sortable(brainstorm3, {
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

  new Sortable(brainstorm4, {
    animation: 150,
  	ghostClass: 'blue-background-class'
  });

// Slide In Panel - by CodyHouse.co
  (function(){
  	var panelTriggers = document.getElementsByClassName('js-cd-panel-trigger');
  	if( panelTriggers.length > 0 ) {
  		for(var i = 0; i < panelTriggers.length; i++) {
  			(function(i){
  				var panelClass = 'js-cd-panel-'+panelTriggers[i].getAttribute('data-panel'),
  					panel = document.getElementsByClassName(panelClass)[0];
  				// open panel when clicking on trigger btn
  				panelTriggers[i].addEventListener('click', function(event){
  					event.preventDefault();
  					addClass(panel, 'cd-panel--is-visible');
            document.getElementById('customer-name').select();
  				});
  				//close panel when clicking on 'x' or outside the panel
  				panel.addEventListener('click', function(event){
  					if( hasClass(event.target, 'js-cd-close') || hasClass(event.target, panelClass)) {
  						event.preventDefault();
  						removeClass(panel, 'cd-panel--is-visible');
  					}
  				});
  			})(i);
  		}
  	}

  	//class manipulations - needed if classList is not supported
  	//https://jaketrent.com/post/addremove-classes-raw-javascript/
  	function hasClass(el, className) {
  	  	if (el.classList) return el.classList.contains(className);
  	  	else return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'));
  	}
  	function addClass(el, className) {
  	 	if (el.classList) el.classList.add(className);
  	 	else if (!hasClass(el, className)) el.className += " " + className;
  	}
  	function removeClass(el, className) {
  	  	if (el.classList) el.classList.remove(className);
  	  	else if (hasClass(el, className)) {
  	    	var reg = new RegExp('(\\s|^)' + className + '(\\s|$)');
  	    	el.className=el.className.replace(reg, ' ');
  	  	}
  	}
  })();
