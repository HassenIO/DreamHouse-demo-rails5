$ ->

  $('a.filepicker').on 'click', (e) ->

    filepicker.pickMultiple(
      {
        mimetype: 'image/*'
        services: ['COMPUTER', 'FACEBOOK', 'INSTAGRAM', 'DROPBOX', 'GOOGLE_DRIVE', 'PICASA', 'URL', 'WEBCAM']
        maxFiles: 2
      }, (Blob) ->

        images = []
        for _, image of Blob
          images.push image.url

        $('#property_images').val(images.join(','))

      , (FPError) ->
        console.log(FPError.toString())
    )

    e.preventDefault()
