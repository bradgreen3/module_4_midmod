$('.links-index').ready(function() {
  $('.link-submit').submit(function(e) {
      e.preventDefault();
      var url = $('#url_').val();
      var title = $('#title_').val();
      var userid = $('.user-email').data('userid');
      createLink(url, title, userid);
    })
  $('.markread').click(function(e) {
    e.preventDefault();
    var linkid = $(this).data('linkid')
    markRead(linkid)
  })
})

function createLink(url, title, userid) {
  $.ajax({
    method: 'POST',
    url: '/api/v1/links/',
    data: {'url': url, 'title': title, 'userid': userid}
  })
  .done(refreshPage)
  .fail(onFail)
}

function markRead(linkid) {
  $.ajax({
    method: 'PATCH',
    url: '/api/v1/links/' + linkid
  })
  .done(refreshPage)
  .fail(onFail)
}

function refreshPage() {
  window.location.reload();
}

function onFail(err) {
  console.error(err);
}
