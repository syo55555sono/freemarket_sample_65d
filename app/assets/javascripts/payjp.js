var form = $("#card__form");
  Payjp.setPublicKey("pk_test_e6a9c40caefb266695329e1b");
//まずはテスト鍵をセットする↑
  $("#submit_btn").on("click",function(e){
    e.preventDefault();
  //↑ここでrailsの処理を止めることでjsの処理を行う
    var card = {
      number: $("#card_number").val(),
      cvc: $("#card_cvc").val(),
      exp_month: $("#card_month").val(),
      exp_year: $("#card_year").val()
    };
   //↑Pay.jpに登録するデータを準備する
    Payjp.createToken(card,function(status,response){
   //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
      form.find("input[type=submit]").prop("disabled", true);
      if(status == 200){//←うまくいった場合200になるので
        $("#card_number").removeAttr("name");
        $("#card_cvc").removeAttr("name");
        $("#card_month").removeAttr("name");
        $("#card_year").removeAttr("name");
       //↑このremoveAttr("name")はデータを保持しないように消している
        var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
        form.append(payjphtml);
        //↑これはdbにトークンを保存するのでjsで作ったトークンをセットしてる
        document.inputForm.submit();
       //↑そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている
        alert("登録が完了しました"); 
      }else{
        alert("カード情報が正しくありません。");
      }
    });
  });