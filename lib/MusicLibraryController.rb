class MusicLibraryController
  def initialize(path)
    @importer = MusicImporter.new(path = "./db/mp3s")
    @importer.import
  end
  def call
    path = gets
    @controller = MusicLibraryController.new()
  end
end
