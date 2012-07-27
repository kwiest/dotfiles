require 'rake'

desc 'Move dotfiles into standard positions'
task :install do
  symlinks = Dir.glob(File.join('**', '*.symlink'))

  skip_all      = false
  overwrite_all = false
  backup_all    = false

  symlinks.each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV['HOME']}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]overwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
          when 'o' then overwrite = true
          when 'b' then backup = true
          when 'O' then overwrite_all = true
          when 'B' then backup_all = true
          when 'S' then skip_all = true
          when 's' then next
        end

        FileUtils.rm_rf(target) if overwrite || overwrite_all
        `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
      end

      `ln -s "$PWD/#{linkable}" "#{target}"`
    end
  end
end

desc 'Remove all linked dotfiles and restore any backups'
task :uninstall do
  symlinks = Dir.glob(File.join('**', '*.symlink'))

  symlinks.each do |linkable|
    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV['HOME']}/.#{file}"

    # Remove all symlinks created in :install task
    if File.symlink?(target)
      FileUtils.rm(target)
    end

    # Restore any backups made during :install task
    if File.exists?("#{ENV['HOME']}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"`
    end
  end
end

task default: 'install'
