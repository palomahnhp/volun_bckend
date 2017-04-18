/**
 * Override and extend InputMask jQuery plugin
 */

var Inputmask = $.fn.inputmask.Constructor;

// Prevent input field from content removing when uncompleted
Inputmask.prototype.blurEvent = function() {
    return
};