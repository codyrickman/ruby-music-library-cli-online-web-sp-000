class MusicLibraryController
  def initialize(path)
    @importer = MusicImporter.new(path)
  end
  def call

  end
end
