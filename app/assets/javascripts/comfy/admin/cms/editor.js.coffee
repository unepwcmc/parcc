$(document).ready( ->
  tinymceInstances = []

  window.CMS?.wysiwyg = ->
    tinymceInstances.forEach( (instance) ->
      tinymce.execCommand('mceRemoveEditor',true, instance)
    )

    tinymceInstances = []
    $('textarea.rich-text-editor, textarea[data-cms-rich-text="true"]').each( (index, textarea) ->
      tinymceInstances.push(textarea.id)
      tinymce.init({
        selector: "##{textarea.id}",
        height: 400,
        plugins: "code anchor image",
        toolbar: """
          insertfile undo redo | styleselect | bold italic |
          alignleft aligncenter alignright alignjustify |
          bullist numlist outdent indent | anchor link | image code
        """,
        style_formats: [
          {title: 'Normal text', block: 'p', classes: 'article__paragraph' },
          {title: 'Bigger text (Introduction)', block: 'p', classes: 'article__paragraph article__paragraph--bigger' },
          {title: 'Section title', block: 'h2', classes: 'article__title--paragraph' }
        ],
        image_list: [
          {title: "feels", value: '/system/comfy/cms/files/files/000/000/001/original/3745008__bc18546a451c541c2825b22a35f72dc1.jpg'}
        ],
        image_caption: true
      })
    )
)

