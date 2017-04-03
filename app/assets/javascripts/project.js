$(document).on('turbolinks:load', function() {

    $('.urls_block.js-files-block').on('nested:fieldAdded', function (event) {
        var $newAddedFile = $(this).find('.js-file-fields:last .js-file-link a.js-visit');
        $newAddedFile.hide();
    });

//         $('.js-arrow').click(function () {
//            $(this).children('span').toggleClass('hidden');
//            $('#files .files-block').toggle(500);
//        })
});