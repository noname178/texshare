$(window).on('load', function(){
  $('.file-thumb').on('click', function(){
    document.getElementById('form-file').click();
  });

  var file_field = $('#form-file');
  file_field.on('change', function(){
    var file = $(this).prop('files')[0],
        fileRdr = new FileReader(),
        thumb = $('.file-thumb');

        if(file.type.match('image.*')){
          fileRdr.onload = function(){
            thumb.attr('src', fileRdr.result);
          }
          fileRdr.readAsDataURL(file);
        }
  });
});