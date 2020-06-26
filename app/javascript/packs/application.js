import "bootstrap";
//= require algolia/v3/algoliasearch.min



import { instantSearchTopics } from '../plugins/instant_search_topics.js';

import { searchArticles } from '../plugins/instant_search_articles_bis.js';




instantSearchTopics();

searchArticles.start();

