$ ->
	search = new Vue
		el: '#search'
		data:
			word: ''

	recipe = [
		{category:"item",	item:"ぷに結晶",	base1:"ひんやり石 x 1", base2:"ぷにぷに玉 x 1"},
		{category:"item",	item:"どくうに",	base1:"ウィローの枝 x 1", base2:"うに x 1", base3:"フェアリーバター x 1"},
		{category:"item",	item:"しびれうに",	base1:"ジギタリスの葉 x 1", base2:"うに x 1", base3:"フェアリーバター x 1"},
		{category:"item",	item:"ブラックうに",	base1:"ウィローの根 x 1", base2:"うに x 1", base3:"フェアリーバター x 1"},
		{category:"item",	item:"ビックリうに",	base1:"マンドラゴラの根 x 1", base2:"うに x 1", base3:"フェアリーバター x 1"},
		{category:"item",	item:"うに袋",	base1:"うに x 2", base2:"端切れ x 1"},
		{category:"item",	item:"鍛冶ハンマー",	base1:"鉄鉱石 x 1", base2:"魚のウロコ x 1"},
		{category:"item",	item:"ぷにボール",	base1:"ぷにぷに玉 x 1", base2:"木の蔓 x 1"},
		{category:"item",	item:"クラフト",	base1:"うに x 1", base2:"黒曜石 x 1"},
		{category:"item",	item:"中和剤・青",	base1:"ゼラチン x 2", base2:"魚のウロコ x 1"},
		{category:"item",	item:"中和剤・赤",	base1:"ゼラチン x 2", base2:"黒曜石 x 1"},
		{category:"item",	item:"中和剤・黄",	base1:"ゼラチン x 2", base2:"土かぶり x 1"},
		{category:"item",	item:"中和剤・緑",	base1:"ゼラチン x 2", base2:"フレッシュリーフ x 1"},
		{category:"item",	item:"レヘルン",	base1:"トネリコの枝 x 3", base2:"中和剤・赤 x 1", base3:"ひんやり石 x 1"},
		{category:"item",	item:"ドナスト",	base1:"トネリコの枝 x 1", base2:"グラビ石 x 1", base3:"中和剤・赤 x 1"},
		{category:"item",	item:"ヒーリングサルブ",	base1:"ヒース草 x 1", base2:"朝露の雫 x 1"},
		{category:"item",	item:"ヒーリングウォーター",	base1:"玉露の雫 x 1", base2:"ヒース草 x 1", base3:"中和剤・緑 x 1"},
		{category:"item",	item:"メンタルウォーター",	base1:"クローバー x 1", base2:"フェアリーバター x 1", base3:"中和剤・緑 x 1"},
		{category:"item",	item:"メンタルボトル",	base1:"四つ葉のクローバー x 1", base2:"フェアリーバター x 2", base3:"中和剤・緑 x 2", base4:"でかぷに玉 x 1"},
		{category:"item",	item:"戦士の秘薬",	base1:"マッシュルーム x 1", base2:"トーン x 1", base3:"中和剤・黄 x 1"},
		{category:"item",	item:"魔法使いの秘薬",	base1:"プラム x 1", base2:"トーン x 1", base3:"中和剤・黄 x 1"},
		{category:"item",	item:"フラム",	base1:"トネリコの枝 x 3", base2:"中和剤・赤 x 1", base3:"黒曜石 x 1"},
		{category:"item",	item:"ランバー",	base1:"トネリコの枝 x 2", base2:"ガマの油 x 1"},
		{category:"item",	item:"闇百合の雫",	base1:"闇百合 x 2", base2:"ガマの油 x 1"},
		{category:"item",	item:"開眼の目覚め薬",	base1:"朝露の雫 x 1", base2:"神秘のミルク x 1", base3:"睡蓮花 x 1"},
		{category:"item",	item:"毒消し薬",	base1:"朝露の雫 x 1", base2:"中和剤・緑 x 1", base3:"ヤドクタケ x 1"},
		{category:"item",	item:"黄金エキス",	base1:"朝露の雫 x 1", base2:"中和剤・緑 x 1", base3:"ハリエニシダ x 1"},
		{category:"item",	item:"気付け薬",	base1:"朝露の雫 x 1", base2:"中和剤・緑 x 1", base3:"ビリビリキノコ x 1"},
		{category:"item",	item:"神秘のアンク",	base1:"鉄鉱石 x 1", base2:"中和剤・緑 x 1", base3:"闇百合 x 1"},
		{category:"item",	item:"癒しのアロマ",	base1:"バラの花びら x 1", base2:"中和剤・緑 x 1", base3:"コンフリー x 1"},
		{category:"item",	item:"魔法の書",	base1:"ヒース草 x 2", base2:"トネリコの枝 x 2", base3:"ぷに玉？ x 2", base4:"睡蓮花 x 2"},
		{category:"item",	item:"焼尽の絵の具",	base1:"マスカット x 1", base2:"中和剤・青 x 1", base3:"朝露の雫 x 1", base4:"完熟リンゴ x 1"},
		{category:"item",	item:"開拓スコップ",	base1:"鉄鉱石 x 2", base2:"トネリコの枝 x 1"},
		{category:"item",	item:"強力接着のり",	base1:"ジャガイモ x 1", base2:"ガマの油 x 2", base3:"神秘のミルク x 1"},
		{category:"item",	item:"特性ハぷにングBOX",	base1:"闇百合の雫 x 1", base2:"クモの糸 x 1", base3:"ぷにぷに玉"},
		{category:"item",	item:"ゼッテル",	base1:"トネリコの枝 x 2", base2:"フレッシュリーフ x 2"},

		{category:"weapon",	item:"ショートソード",	base1:"黒曜石 x 1", base2:"トネリコの枝 x 1", base3:"鉄鉱石 x 1"},

		{category:"armor",	item:"おなべのふた",	base1:"トネリコの枝 x 1", base2:"木の蔓 x 1"},

		{category:"food",	item:"ジャム",	base1:"完熟リンゴ x 1", base2:"はちみつ x 1"},
	]

	data = () ->
		word : ''
		recipes : recipe

	table = new Vue
		el: '#recipe'
		data: data
		computed:
			filterRecipe: ()->
				this.recipes.filter (r) ->
					!search.word? or r.item.indexOf(search.word) > -1 or
					(r.base1? and r.base1.indexOf(search.word) > -1) or 
					(r.base2? and r.base2.indexOf(search.word) > -1) or 
					(r.base3? and r.base3.indexOf(search.word) > -1) or 
					(r.base4? and r.base4.indexOf(search.word) > -1)
	return