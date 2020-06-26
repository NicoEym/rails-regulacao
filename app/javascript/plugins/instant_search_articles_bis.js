
// 1. Instantiate the search
const searchArticles = instantsearch({
  indexName: 'Article',
  searchClient: algoliasearch(process.env.ALGOLIASEARCH_APPLICATION_ID, process.env.ALGOLIASEARCH_API_KEY),
});

const url = window.location.href
if (url.slice(-5) == "icles")
{
searchArticles.addWidgets([
  // 2. Create an interactive search box
  instantsearch.widgets.searchBox({
    container: '#articles_input',
    placeholder: 'Pesquisa nos artigos',
  }),

  instantsearch.widgets.clearRefinements({
    container: '#governance-list',
  }),
  instantsearch.widgets.refinementList({
    container: '#governance-list',
    attribute: 'governance.title',
  }),

  // 3. Plug the search results into the product container
  instantsearch.widgets.hits({
    container: '#articles',
    templates: {
      item: `
                  <div class="col-xs-12 col-md-12">
                  <a href="/articles/{{objectID}}/">
                    <div class="card-article">
                      <img src="https://images.unsplash.com/photo-1462899006636-339e08d1844e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60" />
                      <div class="card-article-infos">
                      <div class="hit-governance">
                        <b>{{#governance}}{{title}}{{/governance}}</b>
                       </div>
                      <div class="hit-section">
                        {{#helpers.highlight}}{ "attribute": "section" }{{/helpers.highlight}}
                       </div>
                       <div class="hit-description">
                       {{#helpers.highlight}}{ "attribute": "details_algolia" }{{/helpers.highlight}}
                       </div>
                      </div>
                    </div>
                  </div>`,
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


export { searchArticles };
