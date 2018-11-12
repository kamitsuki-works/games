$ ->
	jsonUri = "../data/recipe.json";

	search = new Vue
		el: '#search'
		data:
			word: ''

	table = new Vue
		el: '#recipe'
		data:
			recipes : []
		computed:
			filterRecipe: ()->
				this.recipes.filter (r) ->
					!search.word? or r.item.indexOf(search.word) > -1 or
					(r.base1? and r.base1.indexOf(search.word) > -1) or 
					(r.base2? and r.base2.indexOf(search.word) > -1) or 
					(r.base3? and r.base3.indexOf(search.word) > -1) or 
					(r.base4? and r.base4.indexOf(search.word) > -1)

	$.getJSON jsonUri,(json)->
		table.recipes = json.recipe
		$('#msg').text json.msg

	return
