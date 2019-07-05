class MusicLibraryController
  def initialize(path = "./db/mp3s")
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
        count = 1
        raw_songs = @importer.files
        raw_songs.sort! { |a, b|  a<=>b}
        raw_songs.each { |song|  song.gsub!(".mp3", "")}
        raw_songs.each do |song|
          songs << "#{count}. #{song}"
          count++
        puts songs
      end
    end
  end
end
