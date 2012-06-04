<!-- 
// var msg = 'テスト！';
//window.alert(msg);

$(function () {
	$('form').submit(function (e) {
		if ( $('#title').val() === '') {
			window.alert('質問を入力してください。');
			e.preventDefault();
		}
		else if ( $('#option1').val() === '') {
			window.alert('回答１を入力してください。');
			e.preventDefault();
		}
		else if ( $('#option2').val() === '') {
			window.alert('回答２を入力してください。');
			e.preventDefault();
		}
	});
});
-->