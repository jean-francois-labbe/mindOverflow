unless Rails.env.production?
  BetterErrors.editor = Proc.new{|file, line| "emacs://+#{line} #{file}"}
end
