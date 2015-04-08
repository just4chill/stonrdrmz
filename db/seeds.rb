
things = ["user",
		"comment",
		"upvote",
		"downvote",
		"post",
		"category",
		"topics",
		"post_url",
		"post_img",
		"post_title",
		"post_story"
		]

cats = [
			"ALL",
			"RANDOM",
			"FUNNY",
			"JOKES",
			"CELEBS",
			"MOVIES",
			"MONEY",
			"COUNTRY",
			"LOVE",
			"ROMANCE",
			"RELIGIOUS"
		]

tops = [
			"HOT",
			"NEW",
			"RISING",
			"PROMOTED",
			"UPVOTED",
			"DOWNVOTED"
		]

things.each do |thing|
	@thing = Thing.create!(name: thing)
end

@thing = Thing.find_by!(name: "category")
cats.each do |cat|
	@val = @thing.dataas.create!(value: cat)
end

@thing = Thing.find_by!(name: "topics")
tops.each do |top|
	@val = @thing.dataas.create!(value: top)
end


