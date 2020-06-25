import "bootstrap";
//= require algolia/v3/algoliasearch.min


// import { initAutocomplete } from '../plugins/init_autocomplete';
import { instantSearchTopics } from '../plugins/instant_search_topics.js';
// import { instantSearchArticles } from '../plugins/instant_search_articles.js';
import { search} from '../plugins/instant_search_articles_bis.js';

// initAutocomplete();
instantSearchTopics();

// instantSearchArticles();
search.start();

