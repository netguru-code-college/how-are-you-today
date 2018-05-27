class PdfGenerator
  def generate
    Prawn::Document.generate(File.join(Rails.root, "app/pdfs", "hello.pdf")) do
      text "Hello World from pdf!"
    end
  end
end
