function addNode(id, data) {
    if (!id || typeof id == "undefined") return null;
    var node = graph.getNode(id);
    if (!node) node = graph.addNode(id, data);
    return node;
}

function addNeo(graph, data) {
    for (n in data.edges) {
        if (data.edges[n].source) {
            addNode(data.edges[n].source, data.edges[n].source_data );
        }
        if (data.edges[n].target) {
            addNode(data.edges[n].target, data.edges[n].target_data);
        }
    }

    for (n in data.edges) {
        var edge=data.edges[n];
        var found=false;
        graph.forEachLinkedNode(edge.source, function (node, link) {
            if (node.id==edge.target) found=true;
        });
        if (!found && edge.source && edge.target) graph.addLink(edge.source, edge.target);
    }
}

function loadData(graph,id) {
    $.ajax(id ? "/related/" + id : "/related", {
        type:"GET",
        dataType:"json",
        success:function (res) {
            addNeo(graph, {edges:res});
        }
    })
}

var graph = Viva.Graph.graph();	

function onLoad() {

  var layout = Viva.Graph.Layout.forceDirected(graph, {
      springLength:100,
      springCoeff:0.0001,
      dragCoeff:0.02,
      gravity:-1
  });	

  var graphics = Viva.Graph.View.svgGraphics();
  
   highlightRelatedNodes = function(nodeId, isOn) {
      graph.forEachLinkedNode(nodeId, function(node, link){
          if (link && link.ui) {
              link.ui.attr('stroke', isOn ? 'white' : 'gray');
          }
      });
   };

  graphics.node(function(node) {

	var ui = Viva.Graph.svg('g'),
        svgText = Viva.Graph.svg('text').attr('y', '-4px').text(node.data.name),
        img = Viva.Graph.svg('image')
           .attr('width', 32)
           .attr('height', 32)
           .link('/img/' + node.data.type + '.png');

    ui.append(svgText);
    ui.append(img);

	$(ui).hover(function() { // mouse over
	                    highlightRelatedNodes(node.id, true);
	                    $('#explanation').html(node.data.description);
	                }, function() { // mouse out
	                    highlightRelatedNodes(node.id, false);
	                });
	$(ui).click(function() { 
			        	if (!node || !node.position) return;
			        	renderer.rerender();
			        	loadData(graph,node.id);
			}
	);

    return ui;
  }).placeNode(function(nodeUI, pos) {
      // 'g' element doesn't have convenient (x,y) attributes, instead
      // we have to deal with transforms: http://www.w3.org/TR/SVG/coords.html#SVGGlobalTransformAttribute 
      nodeUI.attr('transform', 
                  'translate(' + 
                        (pos.x - 16) + ',' + (pos.y - 16) + 
                  ')');
  });
	
  var renderer = Viva.Graph.View.renderer(graph,
      {
          layout:layout,
          graphics:graphics,
          container:document.getElementById('neograph'),
          renderLinks:true
      });	

	
  renderer.run();	  
}