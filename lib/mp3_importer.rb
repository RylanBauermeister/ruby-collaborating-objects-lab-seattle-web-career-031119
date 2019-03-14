class MP3Importer

  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = Dir.foreach(path).select { |filename| File.file?("#{path}/#{filename}") }
  end

  def import
    files.map do |file|
      Song.new_by_filename(file)
    end
  end


end
