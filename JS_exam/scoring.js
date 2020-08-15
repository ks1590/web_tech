$(document).ready(function () {
  // 合計点と平均点
  function score_indicate() {
    let subject_points = [
      Number($("#national_language").val()),
      Number($("#english").val()),
      Number($("#mathematics").val()),
      Number($("#science").val()),
      Number($("#society").val()),
    ];

    let sum = 0;
    for (let i = 0; i < subject_points.length; i++) {
      sum += subject_points[i] << 0;
    }

    $("#sum_indicate").text(sum);

    let average = sum / subject_points.length;

    $("#average_indicate").text(average);
  }

  // ランク分け("A", "B", "C", "D")
  function get_achievement() {
    let averageIndicate = $("#average_indicate").text();
    console.log(averageIndicate);

    if (averageIndicate >= 80) {
      $("#evaluation").text("A");
    } else if (averageIndicate >= 60) {
      $("#evaluation").text("B");
    } else if (averageIndicate >= 40) {
      $("#evaluation").text("C");
    } else {
      $("#evaluation").text("D");
    }

    return $("#evaluation").text();
  }

  // 合格/不合格の判断
  function get_pass_or_failure() {
    let count_failure = 0;
    $(".subject").each(function (index, elm) {
      if ($(elm).val() < 60) {
        $("#judge").text("不合格");
        count_failure++;
      }
      if (count_failure === 0) {
        $("#judge").text("合格");
      }
    });

    return $("#judge").text();
  }

  // 最終的ジャッジ
  $("#btn-declaration").on("click", function () {
    let achievement = get_achievement();
    let pass_or_failure = get_pass_or_failure();

    $("#alert-indicate").remove();
    $("#declaration").append(
      `<label id="alert-indicate" class="alert alert-info">あなたの成績は${achievement}で${pass_or_failure}です</label>`
    );
  });

  // [国語の点数,英語の点数,数学の点数,理科の点数,社会の点数]のいずれかの点数が変更された際に「function score_indicate()」を発火させる処理です。
  $("#national_language, #english, #mathematics, #science, #society").change(
    function () {
      score_indicate();
    }
  );
  // 「ランク」(id="evaluation")ボタンを押したら「get_achievement()」が出力される処理です。
  $("#btn-evaluation").click(function () {
    $("#evaluation").text(get_achievement());
  });
  // 「判定」(id="btn-judge")ボタンを押したら「function et_pass_or_failure()」が出力される処理です。
  $("#btn-judge").click(function () {
    $("#judge").text(get_pass_or_failure());
  });
});
