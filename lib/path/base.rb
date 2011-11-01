module Path
  class Base
    def initialize(file_path)
      @path = File.expand_path(file_path)
    end

    def to_s
      @path
    end

    def link!
      File.symlink(@path, Path::BASE)
    end

    def link?
      begin
        File.exist?(@path) and File.readlink(@path)
      rescue Errno::EINVAL
        false
      end
    end
    
    def changed?
      link = Path.to(Path::BASE).link? 
      link and @path == link
    end
    
    def exist?
      File.exist?(@path)
    end
    
    def == path
      path.to_s == @path
    end
  end
end