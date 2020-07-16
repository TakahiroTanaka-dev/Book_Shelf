$(function(){
  $(".Search__form__input").on("keyup", function(){
    let input = $(".Search__form__input").val();
    let search_list=$('.Book-list');

    function appendBook(book){
      let html=`
      <div class="Book-list__items">
        <a href="/books/${book.id}" data-method="get"><img alt="" class="Images" src="${book.image}"></a>
        <div class="Book-list__items__content">
          ${book.name}
        </div>
      </div>
      `
      console.log(html);
      search_list.append(html);
    }

    function appendErrMsgToHTML(msg) {
      let html = `<div class='name'>${ msg }</div>`
      search_list.append(html);
    }

    $.ajax({
      type: 'GET',
      url: '/books/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(books){
      $(".Book-list").empty();
      if (books.length !== 0){
        books.forEach(function(book){
          appendBook(book);
        })
      }
      else {
        appendErrMsgToHTML("本が存在しません"); 
      }
    })

    .fail(function(){
      alert('ログインしてください');
    })
    
  });
});