(function ($) {
  "use strict";
  var fullHeight = function () {
    $(".js-fullheight").css("height", $(window).height());
    $(window).resize(function () {
      $(".js-fullheight").css("height", $(window).height());
    });
  };
  fullHeight();
  $("#sidebarCollapse").on("click", function () {
    $("#sidebar").toggleClass("active");
  });
})(jQuery);
const balance = document.getElementsByClassName("balance")[0].lastElementChild;
const amount = parseFloat(balance.textContent);
if (amount>=0){
  balance.style.color="#5dce3a";
}

function prepare_data(data){
  const table = document.querySelector("table");
  const tbody = document.querySelector("tbody");
  const search_message = document.getElementById("search_message");
  if (search_message !== null){
      search_message.remove();
  }
  tbody.innerHTML = "";
  if (table.style.display === "none"){
    table.style.display = "";
  }
  let i = 1;
  if(data["status"] === false){
    const message = document.createElement("p");
    message.className = "color_message";
    message.id = "search_message";
    message.textContent = data["message"];
    table.parentElement.prepend(message);
    table.style.display = "none";
  }else{

    for(element of data["data"]){
      const tr = document.createElement("tr");
      const th = document.createElement("th");
      th.textContent = i;
      th.scope = "row";
      tr.appendChild(th);
      let k = 0;
      for(each of element){
        const td = document.createElement("td");
        if(k==element.length-1){
          const a = document.createElement("a");
          a.className = "btn btn-primary";
          a.href = each;
          a.textContent="Open";
          a.target="_blank";
          td.appendChild(a);
        }else{
          td.textContent = each;
        }
        tr.appendChild(td);
        k++;
      }
      i++;
      tbody.appendChild(tr);
    }
  }


}

const search_button = document.getElementById("search");
const alert_message = document.getElementById("alert_message");
search_button.addEventListener("click",(e)=>{
    e.preventDefault();
    search_button.setAttribute("disabled",true);
    const search_text = search_button.parentElement.firstElementChild;
    alert_message.style.display = "none";
    if (search_text.value.length == 0){
      alert_message.style.display = "flex";
      search_button.disabled=false;
    }else{
      const data_for_post = new FormData();
      data_for_post.append("search",search_text.value);
      fetch('./main/main.php', {
        method: 'POST',
        headers: {
        },
        body: data_for_post
      })
      .then((response) => {
        return response.text();
      })
      .then(data => {
        const resp_data = JSON.parse(data);
        prepare_data(resp_data);
        search_button.disabled=false;
      })
      .catch((error) => {
        console.log("error");
        search_button.disabled=false;
      });
    }
});

document.querySelector("tbody").addEventListener("click",(e)=>{

  if(e.target.tagName === "TD"){
    if(e.target.textContent === "Open"){
      const val = e.target.firstElementChild.href

      navigator.clipboard.writeText(val);
    }else{
      const val = e.target.textContent;
      navigator.clipboard.writeText(val);
    }

  }
});
