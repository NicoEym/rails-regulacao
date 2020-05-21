import "bootstrap";
//= require algolia/v3/algoliasearch.min
import { initAutocomplete } from '../plugins/init_autocomplete';
import { instantSearchTopics } from '../plugins/instant_search_topics.js';
import { instantSearchArticles } from '../plugins/instant_search_articles.js';


// initAutocomplete();
instantSearchTopics();
instantSearchArticles();
