/**
 * Override and extend InputMask jQuery plugin
 */

// Prevent input field from content removing when uncompleted
$.fn.inputmask.Constructor.prototype.blurEvent = function() {
    return
};