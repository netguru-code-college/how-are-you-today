# frozen_string_literal: true.

class PdfGenerator
  def generate
    Prawn::Document.generate(Rails.root.join("app/pdfs", "hello.pdf")) do
      text "Hello World asdfasdf pdf!"
    end
  end
end
