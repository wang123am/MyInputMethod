# MyInputMethod
MyInputMethod,我的输入法...


##参考

技术参考:
iOS基础集合类:https://github.com/ming1016/study/wiki/iOS%E5%9F%BA%E7%A1%80%E9%9B%86%E5%90%88%E7%B1%BB
iOS-Core-Animation-Advanced-Techniques:http://www.cocoachina.com/ios/20150104/10814.html
自定义控件:http://objccn.io/issue-3-4/
How To Make a Custom Control:http://www.raywenderlich.com/36288/how-to-make-a-custom-control

AutoLayoutDemo:https://github.com/yechunjun/AutoLayoutDemo
先进的自动布局工具箱:http://objccn.io/issue-3-5/
细数AutoLayout以来UIView和UIViewController新增的相关API:http://chun.tips/blog/2014/10/23/xi-shu-autolayoutyi-lai-uiviewhe-uiviewcontrollerxin-zeng-de-xiang-guan-api-uiviewpian/
自动布局（autolayout）环境下图片编辑器的实现:http://blog.csdn.net/lihuiqwertyuiop/article/details/40015521
iOS界面开发的大一统:http://onevcat.com/2014/07/ios-ui-unique/


How can I set image in textDocumentProxy with custom keyboard extension iOS 8?:
http://stackoverflow.com/questions/28630338/how-can-i-set-image-in-textdocumentproxy-with-custom-keyboard-extension-ios-8
iOS-Headers私有API:https://github.com/MP0w/iOS-Headers


Undo typing in UITextView:http://stackoverflow.com/questions/1991897/undo-typing-in-uitextview
Undo/redo with a UITextView:http://stackoverflow.com/questions/4070291/undo-redo-with-a-uitextview-ios-iphone/4071681#4071681

Designing for iOS - Taming UIButton:https://robots.thoughtbot.com/designing-for-ios-taming-uibutton


特殊符号:
Unicode字符:https://en.wikipedia.org/wiki/Category:Unicode


特殊表情:
getEmoji:http://getemoji.com/
Unicode/List of useful symbols:https://en.wikibooks.org/wiki/Unicode/List_of_useful_symbols
Emoji Unicode Tables:http://apps.timwhitlock.info/emoji/tables/unicode


color picker：https://github.com/kartech/colorpicker


# MyKeyboard设计需求
-----------------

## 皮肤
1.键盘背景(图片或渐变色)；
3.按键背景透明 及 高亮不透明度；
4.按键圆角、边框线、阴影；
5.按键主字符字体类型、大小、颜色；
6.按键辅字符字体类型、大小、颜色；

7.“设置按钮”字体、反转颜色、图片


## 主题设计
1.无边框、无阴影；
2.按键主字符字体类型,颜色；
3.按键辅字符字体类型,颜色；
参见:http://iosfonts.com/

4.键盘背景图(1)；
5.字符按键contentView背景图 与 高亮背景图 (2)；
6.功能按键contentView背景图 与 高亮背景图 (2)；
	
7.“设置按钮”图片、字体反转颜色

字体尽可能设置成动态字体，以支持系统的字体大小设置；

