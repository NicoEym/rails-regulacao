import "bootstrap";
//= require algolia/v3/algoliasearch.min
//= require hogan
import { initAutocomplete } from '../plugins/init_autocomplete';
import { instantSearchTopics } from '../plugins/instant_search_topics.js';

// initAutocomplete();
instantSearchTopics();
