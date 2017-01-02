%w(borderline table).each do |filename|
  require_relative "painless-table/#{filename}"
end