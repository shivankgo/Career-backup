setInterval(() => {

    var d = new Date();

    htime = d.getHours();
    mtime = d.getMinutes();
    stime = d.getSeconds();

    htransform = 30 * htime + mtime / 2;
    mtransform = 6 * mtime;
    stransform = 6 * stime;

    document.getElementById("hours").style.transform = 'rotate(' + htransform + 'deg)';
    document.getElementById("minutes").style.transform = 'rotate(' + mtransform + 'deg)';
    document.getElementById("secondes").style.transform = 'rotate(' + stransform + 'deg)';

}, 1000);