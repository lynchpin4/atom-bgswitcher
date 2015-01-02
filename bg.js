$ = window.jQuery;

$(function(){
  $.get("https://raw.githubusercontent.com/gstack/bars-backgrounds/master/bgs.txt", function (data) {
    var imgs = mgs = data.split("\n").map(function(x) { return "https://raw.githubusercontent.com/gstack/bars-backgrounds/master/"+x; });
    console.log('loaded background images');
    console.dir(imgs);
    $("body").bgswitcher({
      images: imgs,
      loop: true,
      shuffle: true,
      duration: 1400,
      /* switch once per 2~ minutes */
      interval: (150 * 1000) + ((Math.floor(Math.random() * 200)) * 50)
    });
  });
});
