@Option = {
  add: ->
    index = $('#options').children().length + 1
    $('#options').append(
      '<span class="glyphicon glyphicon-trash" onclick="$(this).next().remove();this.remove();"></span>'
      '<div class="form-group string required poll_options_title">' +
        '<input class="string optional form-control"' +
        ' type="text" name="poll[options_attributes][' + index + '][title]"' +
        ' id="poll_options_attributes_' + index + '_title">' +
      '</div>'
    )
}