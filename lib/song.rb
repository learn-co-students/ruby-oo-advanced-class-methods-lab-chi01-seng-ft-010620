class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    new_song = Song.new
    Song.all << new_song
    new_song
  end

  def Song.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def Song.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    Song.all << new_song
    new_song
  end

  def Song.find_by_name(name)
    Song.all.find{|n| n.name == name}
  end

  def Song.find_or_create_by_name(name)
   # Song.find_by_name(name) ? Song.find_by_name(name) : Song.create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
    
  end

  def Song.alphabetical
    Song.all.sort{|a,b| a.name <=> b.name}
  end

  def Song.new_from_filename(song_file)
    new_song = Song.new
    split_file = song_file.split(/\-|\./)
    split_file[1][0] = ""
    split_file[0][-1]= ""
    new_song.artist_name = split_file[0]
    new_song.name = split_file[1]
    new_song
  end

  def Song.create_from_filename(song_file)
   Song.all << Song.new_from_filename(song_file)
   Song.new_from_filename(song_file)
  end

  def Song.destroy_all
    @@all = []
  end
end
