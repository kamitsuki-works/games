(function() {
  $(function() {
    var jsonUri, search, extendSearch, table;
    jsonUri = "../data/p5s_persona.json";
    mst = new Vue({
      data: {
        nameList: [],
        nameMap: {},
        nextMap: {},
        sortList: []
      }
    });

    search = new Vue({
      el: '#search',
      data: {
        word: '',
        sortList: []
      }
    });
    extendSearch = new Vue({
      el: '#extends',
      data: {
        from: '',
        to: '',
        dataList: [],
        nextMap: {},
        nameMap: {},
        result: ''
      },
      methods: {
        extendSearch: function (event) {
          if (new Number(this.from) < 1 || new Number(this.to) < 1) {
            return;
          }
          var target = this.to;
          var map = {};
          var queue = [];
          queue.push(this.from);
          map[this.from] = [];
          var j = 0;
          while (j < queue.length) {
            var now = queue[j];
            var next = this.nextMap[now];
            for(var i in next) {
              if (map[next[i]] && map[next[i]].length > 0) {
                continue;
              }
              queue.push(next[i]);
              map[next[i]] = [].concat(map[now]);
              map[next[i]].push(now);
            }
            if (map[target] && map[target].length > 0) {
              var names = '';
              for (var k = 0, l = map[target].length; k < l; k++) {
                names += this.nameMap[map[target][k]];
                names += "　⇒　";
              }
              names += this.nameMap[target];
              this.result = names;
              break;
            }
            j++;
            if(j>100){
              break;
            }
          }
        }
      }
    });

    table = new Vue({
      el: '#recipe',
      data: {
        recipes: []
      },
      computed: {
        filterRecipe: function() {
          return this.recipes.filter(function(r) {
            return search.word == null || r.name.indexOf(search.word) > -1 || (r.base1 && r.base1.indexOf(search.word) > -1) || (r.base2 && r.base2.indexOf(search.word) > -1) || (r.base3 && r.base3.indexOf(search.word) > -1) || (r.base4 && r.base4.indexOf(search.word) > -1) || (r.base5 && r.base5.indexOf(search.word) > -1);
          });
        }
      }
    });
    $.getJSON(jsonUri, function(json) {
      var nameMap = {};
      var nameList = [];
      var recipes = [];
      var nextMap = {};
      for(var i in json.persona){
        nameMap[json.persona[i].id] = json.persona[i].name;
        nameList.push(json.persona[i].name);
      }
      for(var i in json.persona){
        var p = json.persona[i];
        for(var j in p.recipe){
          var r = p.recipe[j];
          var recipe = {
            name: p.name,
            drop: p.drop,
            base1: nameMap[r[0]],
            base2: nameMap[r[1]],
            base3: nameMap[r[2]],
            base4: nameMap[r[3]],
            base5: nameMap[r[4]],
          }
          recipes.push(recipe);
          for(var k in r){
            if (!nextMap[r[k]]) {
              nextMap[r[k]] = [];
            }
            if (nextMap[r[k]].indexOf(p.id) < 0) {
              nextMap[r[k]].push(p.id);
            }
          }
        }
      }
      mst.dataList = json.persona;
      mst.nameMap = nameMap;
      mst.nextMap = nextMap;
      mst.nameList = nameList;
      table.recipes = recipes;
      mst.sortList = nameList.slice().sort();
      search.sortList = mst.sortList;
      extendSearch.dataList = mst.dataList;
      extendSearch.nextMap = mst.nextMap;
      extendSearch.nameMap = mst.nameMap;
    });
  });
}).call(this);
