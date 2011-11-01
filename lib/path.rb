require 'path/exceptions'
require 'path/base'
module Path
  BASE = File.expand_path("~/.ssh/id_rsa")

  class << self
    def to(file_path)
      Base.new(file_path)
    end

    def base_remove!
      begin
        File.exist?(Path::BASE) and
          File.readlink(Path::BASE) and
            File.unlink(Path::BASE)
      rescue Errno::EINVAL
        raise NoLinkFound.new(Path::BASE)
      end
    end

    def find(name_or_path)
      case
      when Path.to("~/.ssh/#{name_or_path}").exist?
        to "~/.ssh/#{name_or_path}"
      when Path.to("~/.ssh/id_rsa_#{name_or_path}").exist?
        to "~/.ssh/id_rsa_#{name_or_path}"
      when Path.to(name_or_path).exist?
        to name_or_path
      else
        raise PathNotFound.new(name_or_path)
      end
    end
  end
end