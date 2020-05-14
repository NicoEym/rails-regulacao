


const initAutocomplete = () => {
  var client = algoliasearch('OW017EKY1Y', 'c694d7428b355bd166af3da89f1c4704');

  const topicInput = document.getElementById('topics_input');
  if (topicInput) {
      console.log("toto")
      var index = client.initIndex('TopicIndex');
  index.search('something', { hitsPerPage: 10, page: 0 })
    .then(function searchDone(content) {
      console.log(content)
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
  }

};

export { initAutocomplete };

