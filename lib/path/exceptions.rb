module Path
  class PathException < Exception
    attr_reader :path
    def initialize(path)
      @path = path
    end
  end

  class PathNotFound < PathException
  end

  class NoLinkFound < PathException
  end

  class PathNotChanged < PathException
  end
end