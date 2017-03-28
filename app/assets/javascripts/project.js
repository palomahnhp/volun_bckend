$(document).on('ready page:load turbolinks:load', function() {
    $('.js-files-block').on('nested:fieldAdded', function (event) {
        var $newAddedFile = $(this).find('.js-file-fields:last .js-file-link a');
        $newAddedFile.hide();
    });

//         $('.js-arrow').click(function () {
//            $(this).children('span').toggleClass('hidden');
//            $('#files .files-block').toggle(500);
//        })
});
