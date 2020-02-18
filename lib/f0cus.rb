require 'fileutils'

class F0cus
  FILE = File.join(Dir.home, '.f0cus')

  def self.run(args)
    subcommand = args.shift

    case subcommand
    when 'push'
      str = args.shift
      File.open(FILE, 'a') { |file| file.write("#{str}\n") }
      puts str
      exit
    when 'pop'
      lines = File.readlines(FILE)
      lines.pop
      File.open(FILE, 'w') do |f|
        lines.each do |line|
          f.write(line)
        end
      end
      puts lines.last
    else
      FileUtils.touch(FILE)
      puts File.readlines(FILE).last
    end
  end
end
