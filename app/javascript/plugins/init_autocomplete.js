const initAutocomplete = () => {
  var client = algoliasearch('OW017EKY1Y', '4bd2ad351fc1bb55a5ffd9c2fd98fffd');
  var index = client.initIndex('dev_TOPIC');
  // var autocomplete = require('autocomplete.js');
  const algoliaSearch = document.querySelector("#topics_input");
  // var template = Hogan.compile('<div class="hit-auto-complete">' +
  //       '<div class="name">{{{_highlightResult.name.value}}}</div>' +
  //       '<div class="email">{{{_highlightResult.artigos.value}}}</div>' +
  //     '</div>');






  if (algoliaSearch === null) {return}
  algoliaSearch.addEventListener('keyup', (event) => {
    const drop = document.querySelector(".row");
    // grid.innerHTML = "";
    var keyword = event.currentTarget.value;
    drop.innerHTML = "";
    index.search(keyword, { hitsPerPage: 5, page: 0 })
    .then(function searchDone(content) {
      content.hits.forEach((hit) => {

        console.log(addItineraryCard(hit));
        // return template.render(hit);
      })
    // console.log(content.hits[0].name)
    })
    .catch(function searchFailure(err) {
    console.error(err);
  });
  });

};






const  addItineraryCard = (json) => {
    const drop = document.querySelector(".row");
  drop.insertAdjacentHTML('beforeend', html(json));
};



const html = (json) => {
const new_html = `
                  <button class="dropdown-item" type="button">${json.name}</button>
                `;
  return new_html;
    };







  // function newHitsSource(index, params) {
  //   return function doSearch(query, cb) {
  //     index
  //       .search(query, params)
  //       .then(function(res) {
  //         cb(res.hits, res);
  //       })
  //       .catch(function(err) {
  //         console.err(err);
  //         cb([]);
  //       });
  //   };
  // }

  // autocomplete('#topics_input', { hint: false }, [
  //   {
  //     source: newHitsSource(index, { hitsPerPage: 5 }),
  //     displayKey: 'my_attribute',
  //     templates: {
  //       suggestion: function(suggestion) {
  //         return suggestion._highlightResult.my_attribute.value;
  //       }
  //     }
  //   }
  // ]).on('autocomplete:selected', function(event, suggestion, dataset, context) {
  //   console.log(event, suggestion, dataset, context);
  // });




export { initAutocomplete };

