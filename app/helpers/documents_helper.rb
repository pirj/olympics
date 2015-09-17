module DocumentsHelper
  def size_in_mb bytes
    (bytes/1000000.0).ceil
  end
end
