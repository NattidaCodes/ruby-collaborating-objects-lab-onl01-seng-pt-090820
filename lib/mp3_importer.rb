class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*mp3").collect do |filepath|
      filepath.gsub("./spec/fixtures/mp3s/", "")
    end
  end

  def import
    self.files.each do |file|
      song = Song.new_by_filename(file)
      Artist.all << song.artist unless Artist.all.include?(song.artist)
    end
  end

end
