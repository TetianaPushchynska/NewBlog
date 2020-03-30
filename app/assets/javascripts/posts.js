$(document).on('ajax:success', '.like', function (event) {
    $(this).closest('.btn-group');
});

$(document).on('ajax:success', '.dislike', function (event) {
    $(this).closest('.btn-group');
});