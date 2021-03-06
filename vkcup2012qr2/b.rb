n,m = STDIN.gets.chomp.split(/ /).map(&:to_i)
markers = n.times.map { STDIN.gets.chomp.split(/ /).map(&:to_i) }
caps_ = m.times.map { STDIN.gets.chomp.split(/ /).map(&:to_i) }

caps = {}
caps_.each do |i|
  caps[i[1]] ||= {}
  caps[i[1]][i[0]] ||= []
  caps[i[1]][i[0]] << true
end

beautiful = 0
closed = 0
done = []


markers.each_with_index do |m,_|
  if (h = caps[m[1]]) && (a = h[m[0]]) && a.shift
    done << _
    beautiful += 1
    closed += 1
    h.delete m[0] if a.empty?
  end
end

done.each{|i| markers[i] = nil }

markers.each_with_index do |m,_|
  next unless m
  if (h = caps[m[1]]) && (a = h.first) && a[1].shift
    closed += 1
    h.delete a[0] if a[1].empty?
  end
end

puts "#{closed} #{beautiful}"
