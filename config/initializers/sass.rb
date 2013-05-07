begin
  require 'ext/sass/bower_importer'
rescue LoadError
  $: << File.join(File.dirname(__FILE__), '..', '..', 'lib')
  retry
end
Sass.load_paths << Sass::Importers::BowerImporter.new("components")
