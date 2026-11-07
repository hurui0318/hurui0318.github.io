# frozen_string_literal: true

# Lets this site override includes shipped by the al_folio_* gems (the CV
# templates, plus selected_papers.liquid) without creating a starter-owned
# _includes/ directory (the style contract in test/style_contract.js rejects
# that in this repository).
#
# Files in _cv_includes/ take precedence over the gems' includes.
Jekyll::Hooks.register :site, :after_init do |site|
  next unless site.respond_to?(:includes_load_paths)

  dir = File.join(site.source, "_cv_includes")
  site.includes_load_paths.unshift(dir) if Dir.exist?(dir)
end