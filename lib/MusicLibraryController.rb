class MusicLibraryController
  def initialize(path)
    @importer = MusicImporter.new(path = "./db/mp3s")
    @importer.import
  end
  def call
    puts "Enter Path"
    path = gets
    @controller = MusicLibraryController.new(path)
  end
end
