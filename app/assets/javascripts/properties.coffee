fpServices = ['COMPUTER', 'FACEBOOK', 'INSTAGRAM', 'DROPBOX', 'GOOGLE_DRIVE', 'PICASA', 'URL', 'WEBCAM']

$ ->

  $('#upload-images-button').on 'click', (e) ->
    $button = $(this)

    filepicker.pickMultiple(
      {
        mimetype: 'image/*'
        services: fpServices
        maxFiles: 10
      }, (Blob) ->

        $imagesList = $button.parent().parent().children('ul')
        $imagesList.html('')

        images = []
        for _, image of Blob
          images.push image.url
          $imagesList.append("<li class='uploaded-image'><img src='" + image.url + "'/></li>")

        $('#property_images').val(images.join(','))

      , (FPError) ->
        console.log(FPError.toString())
    )

    e.preventDefault()

  $('#upload-floorplan-button').on 'click', (e) ->
    $button = $(this)

    filepicker.pick(
      {
        mimetype: 'image/*'
        services: fpServices
      }, (Blob) ->

        $imagesList = $button.parent().parent().children('ul')
        $imagesList.html("<li class='uploaded-image'><img src='" + Blob.url + "'/></li>")

        $('#property_floorplan').val(Blob.url)

      , (FPError) ->
        console.log(FPError.toString())
    )

    e.preventDefault()

  $('#property-show #property-images').slick({
    autoplay: true
    autoplaySpeed: 5000
    dots: true
  })
