arr = ["Python ve ailesi","Ruby ve ailesi","Proglamlama temelleri","Basit HTML ve CSS","Genel Konular","Javascript","SCSS"]

arr.each do |i|
	puts "-- #{i} forumu oluşturuldu" if Forum.find_or_create_by(name:i) 
end