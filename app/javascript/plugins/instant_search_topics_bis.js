
// 1. Instantiate the search
const searchTopics = instantsearch({
  indexName: 'Topic',
  searchClient: algoliasearch(process.env.ALGOLIASEARCH_APPLICATION_ID, process.env.ALGOLIASEARCH_API_KEY),
});

const url = window.location.href
if (url.slice(-5) == "opics")
{
searchTopics.addWidgets([
  // 2. Create an interactive search box
  instantsearch.widgets.searchBox({
    container: '#topics_input',
    placeholder: 'Pesquisa nos assuntos',
  }),



  // 3. Plug the search results into the product container
  instantsearch.widgets.hits({
    container: '#topics',
    templates: {
      item: `
              <div class="col-xs-12 col-md-4">
                  <a href="/topics/{{objectID}}/">
                    <div class="card-topic" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.3)), url(https://images.unsplash.com/photo-1504607798333-52a30db54a5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)">
                         <div class="card-topic_details">
                          <h2 class="text-center">{{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}} </h2>
                        </div>
                    </div>
                  </div>
                `,
    },
  }),

  // 4. Make the brands refinable
  // instantsearch.widgets.refinementList({
  //   container: '#brand',
  //   attribute: 'governance',
  // }),
]);
}
// 5. Start the search!


export { searchTopics };


