Topic.all.each do |topic|
	Topic.reset_counters topic.id,:comments
end