import "bootstrap";
//= require algolia/v3/algoliasearch.min


// import { initAutocomplete } from '../plugins/init_autocomplete';
import { instantSearchTopics } from '../plugins/instant_search_topics.js';
// import { instantSearchArticles } from '../plugins/instant_search_articles.js';



import { searchArticles } from '../plugins/instant_search_articles_bis.js';
  // searchArticles.start()};


// import { searchTopics } from '../plugins/instant_search_topics_bis.js';
  // searchTopics.start()};

// initAutocomplete();
instantSearchTopics();

// instantSearchArticles();

searchArticles.start();
// searchTopics.start();

