forums = ['Ruby ve ailesi','Proglamlama temelleri','Basit HTML/CSS','Genel konular','Tasarım genel']

forums.each do |forum|
	Forum.find_or_create_by(name:forum)
	puts "-- #{forum} formu oluşturuldu"
end