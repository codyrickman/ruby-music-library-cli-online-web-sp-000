class MusicLibraryController
  def initialize(path = "./spec/fixtures/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end
  def call
    @controller = MusicLibraryController.new()
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while true do
      puts "What would you like to do?"
      case gets.gsub(/\n/,"")
      when "exit"
        return
        break
      when "list songs"
        list_songs
      end
    end
  end
  def list_songs
    output = []
    raw_songs = Song.all
    raw_songs.sort_by! { |song|  song.name}
    raw_songs.each_with_index do |song, key|
      num = key.to_i + 1
      output << "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    output.uiq!
    puts output
  end
end
