YAHOO.util.Event.onDOMReady( function(){
  var trimRegex = /^\s\+|\s+$/g;
  var markError = function( obj ) {
    // add the class 'ezcca-error' to the obj
    YAHOO.util.Dom.addClass( obj, 'ezcca-error' );
  };

  var clearError = function( obj ) {
    // remove the class 'ezcca-error' to the obj
    YAHOO.util.Dom.removeClass( obj, 'ezcca-error' );
  };

  var controls = YAHOO.util.Dom.getElementsByClassName( 'ezcca-required', 'input' );
  controls = controls.concat(YAHOO.util.Dom.getElementsByClassName( 'ezcca-required', 'textarea' ));
  for ( var i = 0; i < controls.length; i++ ) {
    // gets the parent form element
    var parentForm = YAHOO.util.Dom.getAncestorByTagName( controls[i], 'form' );
    YAHOO.util.Event.addListener(
      parentForm,
      'submit',
      function( t, o ) {
        if ( t.explicitOriginalTarget.name == 'PublishButton' &&
             ! o.value.replace( trimRegex ) ) {
          YAHOO.util.Event.preventDefault( t );
          markError( o );
        }
      },
      controls[i]
      );

    YAHOO.util.Event.addListener(
      controls[i],
      'blur',
      // here's the function that we'll call on blur
      function( t, o ) {
        if ( ! o.value.replace( trimRegex ) ) {
          markError( o );
        } else {
          clearError( o );
        }
      },
      controls[i]
    );
  }
});

