const instantSearchTopics = () => {
  var client = algoliasearch(process.env.ALGOLIASEARCH_APPLICATION_ID, process.env.ALGOLIASEARCH_API_KEY);
  var index = client.initIndex('TOPIC');
  const algoliaSearch = document.querySelector("#topics_input");


  if (algoliaSearch === null) {return}
  algoliaSearch.addEventListener('keyup', (event) => {
    const drop = document.querySelector(".row");
    // grid.innerHTML = "";
    var keyword = event.currentTarget.value;
    drop.innerHTML = "";
    index.search(keyword, { hitsPerPage: 15, page: 0 })
    .then(function searchDone(content) {
      content.hits.forEach((hit) => {
        console.log(addItineraryCard(hit));
      })

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
              <div class="col-xs-12 col-md-4">
                  <a href="/topics/${json.id}/">
                    <div class="card-topic" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(https://images.unsplash.com/photo-1504607798333-52a30db54a5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)">

                         <div class="card-topic_details">
                          <h2 class="text-center">${json.name} </h2>
                          <h6 class="text-center">${json.artigos} artigo(s) relacionado(s)...</h6>
                        </div>
                    </div>
                  </div>
                `;
  return new_html;
};


export { instantSearchTopics };
