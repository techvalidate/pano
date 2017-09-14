#= require dropzone

Dropzone.autoDiscover = false

UI.load ->
  if Dropzone.isBrowserSupported()
# dropzone callbacks
    dropSuccess = (responseText) ->
      $(document).trigger 'inline-spinner:hide', '.dropzone'
      eval(responseText) # Just redirects to the current page via Turbolinks

    dropError = (file, message, dropzone) ->
      dropzone.removeFile(file)
      alert(message)

    onProgress = (file, progress, bytesSent) ->
      if progress >= 100
        # reset the progressbar and show the spinner while the image is processing
        $('[data-dz-uploadprogress]').css 'width', 0
        $('.dz-progress').css 'transition', 'none'
        $('.dz-progress').css 'opacity', 0
        $('.dz-filename').addClass 'processing'
        $(document).trigger 'inline-spinner:show', '.dropzone'

    # override Dropzone's default image sizer for thumbnail previews
    onResize = (file) ->
      thmbHeight = 0
      thmbWidth = 0
      previewHeight = parseInt($('.dropzone.dropzone-image-form').css('height'), 10)
      previewWidth = parseInt($('.dropzone.dropzone-image-form').css('width'), 10)

      if file.height >= file.width
        if file.height > previewHeight
          thmbHeight = previewHeight
          thmbWidth = previewHeight * file.width / file.height
        else
          thmbHeight = this.options.thumbnailHeight
          thmbWidth = parseInt this.options.thumbnailHeight * file.width / file.height
      else
        if file.width > previewWidth
          thmbHeight = previewWidth * file.height / file.width
          thmbWidth = previewWidth
        else
          thmbHeight = parseInt this.options.thumbnailWidth * file.height / file.width
          thmbWidth = this.options.thumbnailWidth

      return {
        srcX:0,
        srcY:0,
        srcWidth: file.width,
        srcHeight: file.height,
        trgX:0,
        trgY:0,
        trgWidth: thmbWidth,
        trgHeight: thmbHeight
      }

    # find image form elements that need dropzones
    $('.dropzone-image-form').each(->
      dzForm = $ this
      param = dzForm.data 'dropzone-param'
      # instantiate image uploaders
      dropzone = new Dropzone('.dropzone-image-form', {
        headers: {"Accept": "text/javascript"},
        paramName: param,
        acceptedFiles: "image/*",
        uploadMultiple: false,
        clickable: true,
        maxFiles: 1,
        maxFilesize: 5,
        resize: onResize
      })

      # event handlers
      dropzone.on 'success', (file, responseText) ->
        dropSuccess responseText

      dropzone.on 'error', (file, message, test) ->
        dropError file, message, this

      dropzone.on 'uploadprogress', (file, progress, byesSent) ->
        onProgress file, progress, byesSent
    )

    # find csv form elements that need dropzones
    $('.dropzone-csv-form').each(->
      dzForm = $ this
      param = dzForm.data 'dropzone-param'
      # instantiate csv uploaders
      dropzone = new Dropzone('.dropzone-csv-form', {
        headers: {"Accept": "text/javascript"},
        paramName: param,
        acceptedFiles: "text/csv,.csv",
        uploadMultiple: false,
        clickable: true,
        maxFiles: 1
      })

      # event handlers
      dropzone.on 'success', (file, responseText) ->
        dropSuccess responseText

      dropzone.on 'uploadprogress', (file, progress, byesSent) ->
        onProgress file, progress, byesSent

      dropzone.on 'error', (file, message) ->
        dropError file, message, this
    )

    # find PO file form elements that need dropzones
    $('.dropzone-po-form').each(->
      dzForm = $ this
      param = dzForm.data 'dropzone-param'
      # instantiate csv uploaders
      dropzone = new Dropzone('.dropzone-po-form', {
        headers: {"Accept": "text/javascript"},
        paramName: param,
        acceptedFiles: "text/x-gettext-translation, application/x-po, text/x-po, application/octet-stream, .po",
        uploadMultiple: false,
        clickable: true,
        maxFiles: 1
      })

      # event handlers
      dropzone.on 'success', (file, responseText) ->
        dropSuccess responseText

      dropzone.on 'uploadprogress', (file, progress, byesSent) ->
        onProgress file, progress, byesSent

      dropzone.on 'error', (file, message) ->
        dropError file, message, this
    )
