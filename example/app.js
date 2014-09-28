var win = Ti.UI.createWindow({
	backgroundColor : 'white'
});

win.open();

var UIBlurView = require('com.artanisdesign.uivisualeffect');
Ti.API.info("module is => " + UIBlurView);

Ti.API.info("module exampleProp is => " + UIBlurView.exampleProp);
UIBlurView.exampleProp = "This is a test value";

var img = Ti.UI.createImageView({
	width : 320,
	height : 568,
	top : 0,
	left : 0,
	image : "bg.jpg"
});

win.add(img);

var proxy = UIBlurView.createView({
	effect : "extralight",
	width : Ti.UI.FILL,
	height : 150,
	top : 0,
	left : 0,
	//vibrancyEffect : true
});

//win.add(proxy);

var proxy2 = UIBlurView.createView({
	effect : "light",
	width : Ti.UI.FILL,
	height : 150,
	top : 200,
	left : 0
});

//win.add(proxy2);

var proxy3 = UIBlurView.createView({
	effect : "dark",
	width : Ti.UI.FILL,
	height : 150,
	top : 400,
	left : 0
});

//win.add(proxy3);

var view = Ti.UI.createView({
	height : 120,
	width : 120,
	borderRadius : 10,
	layout : "absolute"
});

var content = Ti.UI.createView({
	zIndex : 1
});
var vbg = UIBlurView.createView({
	effect : "light",
	zIndex : 0
});

var activityIndicator = Ti.UI.createActivityIndicator({
	style : Ti.UI.iPhone.ActivityIndicatorStyle.BIG,
	height : Ti.UI.SIZE,
	width : Ti.UI.SIZE
});
content.add(activityIndicator);

activityIndicator.show();

view.add(vbg);
view.add(content);
win.add(view);
