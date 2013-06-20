  $(document).ready(function() {
    var visualSearch = VS.init({
      container  : $('#search_box_container'),
      query      : 'country: "United States" "U.S. State": "New York" account: 5-samuel',
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
        },
        facetMatches : function(callback) {
          callback([
            'account', 'filter', 'access', 'title',
            { label: 'city',       category: 'location' },
            { label: 'country',    category: 'location' },
            { label: 'U.S. State', category: 'location' },
          ]);
        },
        valueMatches : function(facet, searchTerm, callback) {
          switch (facet) {
          case 'account':
              callback([
                { value: '1-amanda', label: 'Amanda' },
                { value: '2-aron',   label: 'Aron' },
                { value: '3-eric',   label: 'Eric' },
                { value: '4-jeremy', label: 'Jeremy' },
                { value: '5-samuel', label: 'Samuel' },
                { value: '6-scott',  label: 'Scott' }
              ]);
              break;
            case 'filter':
              callback(['published', 'unpublished', 'draft']);
              break;
            case 'access':
              callback(['public', 'private', 'protected']);
              break;
            case 'title':
              callback([
                'Pentagon Papers',
                'CoffeeScript Manual',
                'Laboratory for Object Oriented Thinking',
                'A Repository Grows in Brooklyn'
              ]);
              break;
            case 'city':
              callback([
                'Cleveland',
                'New York City',
                'Brooklyn',
                'Manhattan',
                'Queens',
                'The Bronx',
                'Staten Island',
                'San Francisco',
                'Los Angeles',
                'Seattle',
                'London',
                'Portland',
                'Chicago',
                'Boston'
              ]);
              break;
            case 'U.S. State':
              callback([
                "Alabama", "Alaska", "Arizona", "Arkansas", "California",
                "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida",
                "Georgia", "Guam", "Hawaii", "Idaho", "Illinois",
                "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
                "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
                "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
                "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina",
                "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
                "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
                "Texas", "Utah", "Vermont", "Virginia", "Virgin Islands",
                "Washington", "West Virginia", "Wisconsin", "Wyoming"
              ]);
              break;
            case 'country':
              callback([
                "China", "India", "United States", "Indonesia", "Brazil",
                "Pakistan", "Bangladesh", "Nigeria", "Russia", "Japan",
                "Mexico", "Philippines", "Vietnam", "Ethiopia", "Egypt",
                "Germany", "Turkey", "Iran", "Thailand", "D. R. of Congo",
                "France", "United Kingdom", "Italy", "Myanmar", "South Africa",
                "South Korea", "Colombia", "Ukraine", "Spain", "Tanzania",
                "Sudan", "Kenya", "Argentina", "Poland", "Algeria",
                "Canada", "Uganda", "Morocco", "Iraq", "Nepal",
                "Peru", "Afghanistan", "Venezuela", "Malaysia", "Uzbekistan",
                "Saudi Arabia", "Ghana", "Yemen", "North Korea", "Mozambique",
                "Taiwan", "Syria", "Ivory Coast", "Australia", "Romania",
                "Sri Lanka", "Madagascar", "Cameroon", "Angola", "Chile",
                "Netherlands", "Burkina Faso", "Niger", "Kazakhstan", "Malawi",
                "Cambodia", "Guatemala", "Ecuador", "Mali", "Zambia",
                "Senegal", "Zimbabwe", "Chad", "Cuba", "Greece",
                "Portugal", "Belgium", "Czech Republic", "Tunisia", "Guinea",
                "Rwanda", "Dominican Republic", "Haiti", "Bolivia", "Hungary",
                "Belarus", "Somalia", "Sweden", "Benin", "Azerbaijan",
                "Burundi", "Austria", "Honduras", "Switzerland", "Bulgaria",
                "Serbia", "Israel", "Tajikistan", "Hong Kong", "Papua New Guinea",
                "Togo", "Libya", "Jordan", "Paraguay", "Laos",
                "El Salvador", "Sierra Leone", "Nicaragua", "Kyrgyzstan", "Denmark",
                "Slovakia", "Finland", "Eritrea", "Turkmenistan"
              ], {preserveOrder: true});
              break;
          }
        }
      }
    });
  });
