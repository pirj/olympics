Refile.types[:image] = Refile::Type.new(:image,
  content_type: %w[image/jpeg image/png image/tiff]
)

Refile.types[:document] = Refile::Type.new(:document,
  # extension: %w[ pdf doc docx xls xlsx ],
  content_type: %w[
    application/pdf
    application/msword
    application/vnd.openxmlformats-officedocument.wordprocessingml.document
    application/vnd.ms-excel
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  ]
)
