# frozen_string_literal: true

# Loads assets/css/custom.css after the gem stylesheets on every HTML page.
#
# The <head> markup is owned by al_folio_core, and this repo may not shadow it
# with a local _includes/head.liquid (see test/style_contract.js), so the link
# tag is injected into the rendered output instead.
module SiteCustomCss
  def self.inject(doc)
    return unless doc.output_ext == ".html"
    return unless doc.output&.include?("</head>")

    href = "#{doc.site.baseurl}/assets/css/custom.css"
    doc.output = doc.output.sub("</head>", %(<link rel="stylesheet" href="#{href}">\n</head>))
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  SiteCustomCss.inject(doc)
end
