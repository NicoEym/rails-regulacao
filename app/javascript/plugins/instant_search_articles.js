const instantSearchArticles = () => {
  var client = algoliasearch(process.env.ALGOLIASEARCH_APPLICATION_ID, process.env.ALGOLIASEARCH_API_KEY);
  var index = client.initIndex('dev_ARTICLE');
  const algoliaSearch = document.querySelector("#articles_input");


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
                  <div class="col-xs-12 col-md-12">
                  <a href="/articles/${json.id}/">
                    <div class="card-article">
                      <img src="https://images.unsplash.com/photo-1462899006636-339e08d1844e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60" />
                      <div class="card-article-infos">
                        <div class="card-article-title">
                          <h6>${json.governance}</h6>
                          <p class="green"><b>${json.chapter} - ${json.section}</b></p>
                        </div>
                        <div class="card-article-details">
                          <p>${json.details.slice(0,100)} [...]</p>
                        </div>
                      </div>
                    </div>
                </div>
                `;
  return new_html;
};


export { instantSearchArticles };
