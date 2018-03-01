document.addEventListener('turbolinks:load', function() {
  var progressBar = document.getElementById('test-progress');

  var questionNumber = progressBar.dataset.questionNumber;
  var questionsCount = progressBar.dataset.questionsCount;

  var progressPercent = questionNumber/questionsCount * 100;

  progressBar.style.width = progressPercent + "%"
  
});