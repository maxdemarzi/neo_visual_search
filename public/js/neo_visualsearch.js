var visualSearch;

$(document).ready(function() {
  var facets=[];
  $.ajax("/facets", {
         type:"GET",
         dataType:"json",
         success:function (res) {
            facets = res;
        }
    });	

    visualSearch = VS.init({
      container  : $('#search_box_container'),
      query      : '',
      showFacets : true,
      unquotable : [
        'text',
        'account',
        'filter',
        'access'
      ],
      callbacks  : {
        search : function(query, searchCollection) {
          var $query = $('#search_query');
          var count  = searchCollection.size();
          $query.stop().animate({opacity : 1}, {duration: 300, queue: false});
          $query.html('<span class="raquo">&raquo;</span> You searched for: ' +
                      '<b>' + (query || '<i>nothing</i>') + '</b>. ' +
                      '(' + count + ' facet' + (count==1 ? '' : 's') + ')');
          clearTimeout(window.queryHideDelay);
          window.queryHideDelay = setTimeout(function() {
            $query.animate({
              opacity : 0
            }, {
              duration: 1000,
              queue: false
            });
          }, 2000);

		  $.ajax("/graph", {
		         type:"POST",
		         dataType:"json",
		         data: {facets : visualSearch.searchQuery.facets() },
		         success:function (res) {
  	      	       for (n in res.nodes) {
                     var node=res.nodes[n];
			        addNode(node.id, node.data);
		          }
		
		          addEdges(res.rels);
		       }
		    });	

        },
        facetMatches : function(callback) {
	      if(visualSearch.searchBox.value() != "") {
			  $.ajax("/connected_facets", {
			         type:"POST",
			         dataType:"json",
			         data: {facets : visualSearch.searchQuery.facets() }, //.slice(-1)[0]
			         success:function (res) {
			            callback(res);
			        }
			    });	

          } else { 
            callback(facets);
          }
        },
        valueMatches : function(facet, searchTerm, callback) {
          if(visualSearch.searchBox.value() != "") {
			  $.ajax("/connected_values/" + facet + "/" + searchTerm, {
			         type:"POST",
			         dataType:"json",
			         data: {facets: visualSearch.searchQuery.facets() }, //.slice(-1)[0]
			         success:function (res) {
			            callback(res);
			        }
			    });		
	      } else {
			  $.ajax("/values/" + facet + "/" + searchTerm, {
			         type:"GET",
			         dataType:"json",
			         success:function (res) {
			            callback(res);
			        }
			    });	
			}
        }
      }
    });
  });
