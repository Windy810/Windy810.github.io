---
layout: post
title: "Android开发"
date: 2021-05-25
description: "安卓开发知识点整理"
category: blog
tags: development android
comments: true
---
* content
{:toc}

## 一、GUI开发
### 1.1 常用布局
* 线性布局（LinearLayout）：`android:orientation="horizontal"`用于控制界面水平布局
```
match_parent表示让当前控件的大小和父布局的大小一样，也就是由父布局来决定当前控件的大小
wrap_content表示让当前的控件大小能够刚好包含里面的内容，也就是由控件内容决定当前控件的大小
```
* 相对布局（RelativLayout）：`android:layout_alignParentTop=“true”`控件的顶部与父控件的顶部对齐;
* 表格布局（TableLayout）：每个TableLayout是由多个TableRow组成
```xml
控件常用属性：
android:stretchColumns:设置可伸展的列。该列可以向行方向伸展，最多可占据一整行。
android:shrinkColumns:设置可收缩的列。当该列子控件的内容太多，已经挤满所在行，那么该子控件的内容将往列方向显示。
android:collapseColumns:设置要隐藏的列。
android:layout_column:指定控件在第几列
android:layout_span:占据列数
```
* 网格布局（GridLayout）：
```
控件常用属性：
设置组件的排列方式:  android:orientation=""     vertical(竖直,默认)或者horizontal(水平)
设置组件的对齐方式:  android:layout_gravity="center,left,right,buttom
设置有多少行:android:rowCount="4"       //设置网格布局有4行
设置有多少列:android:columnCount="4"    //设置网格布局有4列
组件在第几行:android:layout_row = "1"   //设置组件位于第二行
组件在第几列:android:layout_column = "2"   //设置该组件位于第三列
横跨几行:android:layout_rowSpan = "2"    //纵向横跨2行
横跨几列:android:layout_columnSpan = "3"     //横向横跨3列
```
* 帧式布局（FrameLayout）：帧布局的大小由控件中最大的子控件决定,如果控件的大小一样大的话,那么同一时刻就只能看到最上面的那个组件!后续添加的控件会覆盖前一个
```
控件常用属性：
android:foreground:设置该帧布局容器的前景图像
android:foregroundGravity:设置前景图像显示的位置
```

### 1.2 常用控件
1. Button
* 基于事件监听内部类：可以在该类中进行复用,可直接访问外部类的所有界面组件
```java=
//直接new一个内部类对象作为参数
btn.setOnclickListener(new ButtonClick());

class ButtonClick implements View.OnclickListener{
    public void onClick(View v){
        xxxx;
    }
}
```
* 基于事件监听内部匿名类：最常用类型，用法简单，适合临时使用一次,复用性不高
```java=
 btn.setOnClickListener(new OnClickListener() {    
            //重写点击事件的处理方法onClick()    
            @Override    
            public void onClick(View v) {       
            }    
        });         
```
* Activity本身作为事件监听器：这种形式非常简洁，但可能造成程序结构混乱，Activity的主要职责应该是完成界面初始化工作，而此时还要包含事件处理器方法，容易引起混乱
```java=
//让Activity方法实现OnClickListener接口
public class MainActivity extends Activity implements OnClickListener{     
        btnshow.setOnClickListener(this);    
    }    
    //重写接口中的抽象方法    
    @Override    
    public void onClick(View v) {          
    }         
}
```
* 直接绑定到标签：
```java=
//自定义一个方法,传入一个view组件作为参数    
    public void myclick(View source){    
} 
```
```xml=
<Button     
        android:layout_width="wrap_content"    
        android:layout_height="wrap_content"    
        android:text="按钮"    
        android:onClick="myclick"/> 
```
2. CheckBox&RadioButton
参考链接：
https://www.runoob.com/w3cnote/android-tutorial-radiobutton-checkbox.html
* 复选框：获得选中的值有两种方式
    a.为每个CheckBox添加事件：setOnCheckedChangeListener 
    b.弄一个按钮，在点击后，对每个checkbox进行判断:isChecked()；
* 单选框：每个按钮都要有id
```java=
RadioGroup radgroup = (RadioGroup) findViewById(R.id.radioGroup);
        //第一种获得单选按钮值的方法  
        //为radioGroup设置一个监听器:setOnCheckedChanged()  
        radgroup.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {
                RadioButton radbtn = (RadioButton) findViewById(checkedId);
                Toast.makeText(getApplicationContext(), "按钮组值发生改变,你选了" + radbtn.getText(), Toast.LENGTH_LONG).show();
            }
        });
```
3. AutoCompleteTextView
操作步骤：
* 通过findViewByID方法建立对象
* 提供数据：数据源可以是数组、XML文件、集合等；
* 提供布局；
* 建立适配器ArrayAdapter
* 关联适配器
```java=
//第一步、创建适配器
String[] arr={"凯撒","凯撒广场","凯撒大帝"};
ArrayAdapter<String> adapter= new ArrayAdapter<String>(this, R.layout.textview, arr);

//第二步、AutoCompleteTextView对象应用适配器
atv = (AutoCompleteTextView)findViewById(R.id.autoTextView);
atv.setAdapter(adapter);
```
```
常用数据适配器
BaseAdapter：抽象类，实际开发中我们会继承这个类并且重写相关方法，用得最多
ArrayAdapter：支持泛型操作，最简单的一个Adapter，只能展现一行文字
SimpleAdapter：同样具有良好扩展性的一个Adapter，可以自定义多种效果
SimpleCursorAdapter：用于显示简单文本类型的listView，一般在数据库那里会用到
```
4. Spinner
数据填充：
```
数据源（以colors为例）：
* List<String>集合 ：List<String> colors=new ArrayList();
* 数组：String[] mItems = {"Item 1", "Item 2", "Item 3", "Item 4"};
* xml文件：ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
this, R.array.colors,android.R.layout.simple_spinner_item);
```
```java=
Spinner spinner = (Spinner) findViewById(R.id.spinner);
// 建立数据源
String[] mItems = {"Item 1", "Item 2", "Item 3", "Item 4"};
ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, mItems);
adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
spinner.setAdapter(adapter);
```
开始监听
```java=
spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
        // TODO
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {
        // TODO
    }
});
```
5. AlertDialog
AlertDialog的构造方法全部是Protected的，所以不能直接通过new一个AlertDialog来创建出一个AlertDialog
要创建一个AlertDialog，就要用到AlertDialog.Builder中的create()方法
```java=
Dialog alertDialog = new AlertDialog.Builder(this).
    setTitle("对话框的标题").
    setMessage("对话框的内容").
    setIcon(R.drawable.ic_launcher).
    create();
    alertDialog.show();
```

## 二、四大组件
### 2.1 Activity
1. 栈管理机制：先进后出
2. 生命周期：onCreate->onStart->onResume->onPause->onStop->onDestroy
（onRestart在onStop之后，下一步到达onStart）
```java=
    /* onCreate:
     * 表示Activity正在被创建，执行一些初始化工作
     * （如：调用 setContentView 加载界面布局资源，初始化Activity所需数据等）；
     */
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }
    /* onStart:
     * 表示Activity正在被启动，这时Activity已经可见(对应用可见)，
     * 只不过还在后台，用户还看不到；
     */
    @Override
    protected void onStart() {
        super.onStart();
    }
    /* onResume：
     * 表示Activity已经出现在前台，用户可见；
     */
    @Override
    protected void onResume() {
        super.onResume();
    }
    /* onPause：
     * 表示Activity正在停止，可以执行存储数据、停止动画等不太耗时的工作
     * （因为新活动的onCreate方法要在旧活动的onPause执行完才执行，
     *  为了不影响用户体验，要求这个过程尽可能在很短时间内完成）；
     */
    @Override
    protected void onPause() {
        super.onPause();
    }
    /* onStop：
     * 表示Activity即将停止，可以做一些稍微重量级的工作，同样不能太耗时；
     */
    @Override
    protected void onStop() {
        super.onStop();
    }
    /* onDestory：
     * 表示Activity即将被销毁，执行回收工作和资源释放。
     */
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
    /* onRestart：
     * 表示Activity正在重新启动，
     * 执行顺序为：onPause → onStop → onRestart → onStart → onResume
     */
    @Override
    protected void onRestart() {
        super.onRestart();
    }
```
* 从OneActivity启动TwoActivity执行情况：OneActivity的onPause()–>然后执行TwoActivity的onCreate()–>onStart()–>onResume()–>最后再执行OneActivity的onStop()
* 从TwoActivity中返回到OneActivity时执行情况：执行TwoActivity的onPause()–>然后执行OneActivity的onRestart()–>onStart()–>onResume()–>再执行TwoActivity的onStop()–>onDestroy()

3. Activity的启动
```java=
Intent intent=new Intent();
intent.setClass(MainActivity.this,SecondActivity.class);
startActivity(intent);
```
4. 消息传递
“宿主Activity“端的流程
1）首先创建一个Intent和Bundle对象，其中Bundle用于存储传递的数据；
	2）然后使用Bundle的putXXX方法输入要传递的数据；
	3）将要传递的数据压入Intent中intent.putExtras(Bundle对象)；
	4）启动“随从Activity“。
```java=
Bundle data=new Bundle();
data.putString("username", user);
Intent intent=new Intent(MainActivity.this,SecondActivity.class);
intent.putExtras(data);
startActivity(intent);
```    
“随从Activity“端的流程
    1）接收“宿主Activity“的Intent；
    2) 传递获得传入的Bundle对象；
    3) 使用Bundle的get方法获取要传递的数据。
```java=
Intent intent=getIntent();
Bundle data=intent.getExtras();
String str=data.getString("username");
tv.setText("欢迎"+str+"使用本系统！");
```

### 2.2 Service
1. 特点：无需交互；程序被杀掉时，服务也停止；比Activity优先级高；用于进程间通信

2. 启动方式
* 本地服务：用于程序内部
`
不论调用了多少次startService()方法，你只需要调用一次stopService()来停止
`
* 远程服务：用于系统内的程序之间
`多个客户端可以绑定至同一个服务。如果服务此时还没有加载，bindService()会先加载它`

3. 生命周期
![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_275c2bdf1b4583a57bc2527d576cf06d.png)
注：
`无论StartService几次，onCreate永远只调用一次`

4. 本地服务的创建与运行
配置：在AndroidManifest.xml文件中使用 <Service android:name = ".myService"/>标签配置该Service（与Activity同级） 

5. 远程服务的调用
远程Service调用就是应用程序之间的Service调用，需要使用Android提供AIDL（Android Interface Definition Language）来实现。
AIDL是Android接口定义语言的意思，它可以用于让某个Service与多个应用程序组件之间进行跨进程通信，从而可以实现多个应用程序共享同一个
Service的功能。

### 2.3 BroadcastReceiver——详见3.2
### 2.4 ContentProvider——详见4.4

## 三、程序间通信
### 3.1 Intent
通过Intent，可实现同一或不同应用程序中的组件之间运行时动态绑定。用于启动Activity（活动）、Services（服务）、Broadcast Receiver（广播接收器)
1. 启动机制
* 显式启动
```java=
//方式一：setClassName
Intent intent = new Intent();
//表示希望启动com.example.test包中的com.example.test.MainActivity
intent.setClassName("com.example.test", "com.example.test.MainActivity");
startActivity(intent);
```
```java=
方式二：SetClass
Intent intent = new Intent();
//表示在宿主Activity中启动随从Activity或者服务
intent.setClass(MainActivity.this,OtherActivity.class);
startActivity(intent);
```
2. 隐式启动
在Java代码中使用setAction（）方法设置
* 例如：intent.setAction(“com.example.My_Action”);
//自定义的Action，清单文件中必须在Intent-filter标签中匹配。
```xml=
<activity    android:name=".SecondActivity"> 
  <intent-filter> 
      <action android:name=" com.example.My_Action "/> 
  </intent-filter> 
</activity> 
```
* intent.setAction(Intent.ACTION_CALL);
//系统Action，不需要在清单文件中匹配

注：
`1)只有<action>和<category>中的内容同时能够匹配上Intent中指定的action和category时，这个活动才能响应Intent。如果没有定义category，则必须使用默认的DEFAULT
`
`2)当有多个应用程序匹配过滤请求时，
可以选择打开方式`

3. Intent Filter
* 通过IntentFilter类生成，下面列举了该类的常用方法：
`addAction(String action)
hasCategory(String category)
getAction (int index)`

* 通过应用程序的清单文件（AndroidManifest.xml）定义`<intent-filter>`生成

### 3.2 BroadcastReceiver
1. 创建BroadcastReceiver的子类
```java=
public class BroadReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        MediaPlayer.create(context, R.raw.wish).start();
    }
}
```
2. 注册BroadcastReceiver
* 静态注册：在配置文件中注册BroadcastReceiver能够匹配的Intent
```xml=
<receiver
    android:name="com.example.test.MyBroadcastReceiver">
    <intent-filter>
        <action android:name="android.intent.action.MyBroadcastReceiver"></action>
        <category android:name="android.intent.category.DEFAULT"></category>
    </intent-filter>
</receiver>
```
* 动态注册：通过代码的方式动态注册
```java=
MyBroadcastReceiver receiver = new MyBroadcastReceiver();  
IntentFilter filter = new IntentFilter(); 
filter.addAction("android.intent.action.MyBroadcastReceiver");
registerReceiver(receiver, filter);

unregisterReceiver();//取消注册
```
两者区别：
* 静态注册：在AndroidManifest.xml文件中进行注册，当App退出后，Receiver仍然可以接收到广播并且进行相应的处理
* 动态注册：在代码中动态注册，当App退出后，也就没办法再接受广播了。

3. 发送广播
```java=
Intent intent = new Intent("android.intent.action.MY_BROADCAST");    
intent.putExtra("msg", "hello receiver");    
sendBroadcast(intent, "android.dsw.data");  
```
记得权限声明：![](https://codimd.s3.shivering-isles.com/demo/uploads/upload_4cc0ae5e4d641ae48d85a560f774ccab.png)

## 四、数据存储
### 4.1 SharedPreferences
1. 特点：轻量级存储；key-value对存储数据；
2. 访问方法：
```
1)getSharedPreferences：此方法用于获取SharedPreferences的对象
2)putxxx 方法：putxxx方法通过key-value对，将数据保存到XML文件中。。
3)commit 方法：对putXXX方法提供的数据进行保存。
4)getxxx 方法：通过SharedPreferences.getxxx的方法获取保存的key-value对的值
```
3. 步骤
```
1)根据Context获取SharedPreferences对象
    mySP=getSharedPreferences(TABLE_NAME, Activity.MODE_PRIVATE);	
2)利用edit()方法获取Editor对象
    editor=mySP.edit();
3)通过Editor对象存储key-value键值对数据
    editor.putString(“name”,”李鹏”);
4)通过commit()方法提交数据
    editor.commit();
```

### 4.2 文件存储
1. 访问应用程序的文件数据
```
FileOutputStream
InputStream
openFileOutput（写入文件）
openFileInput（读文件）
```
注：文件存储在data\data\项目包名\files下
2. 访问SDCard
手机有SD卡且能进行读写
`Environment.getExternalStorageState().equals(Environment.MEDIA_MOUNTED)`

### 4.3 SQLite
1. 特点：在私有的数据库中存储结构化数据
2. 优点：
```
轻量级
无配置
跨平台
语言无关接口
事务性
```

### 4.4 CotentProvider
流传输

## 五、样例
### 5.1 登录：记住密码
```java=
public class MainActivity extends Activity {

    EditText username,password;
    Button login;
    CheckBox isPassword;
    SharedPreferences sp;

@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    username=(EditText) findViewById(R.id.username);
    password=(EditText) findViewById(R.id.password);
    login=(Button) findViewById(R.id.login);
    isPassword=(CheckBox) findViewById(R.id.isRemPassword);
    isPassword.setChecked(true);
    sp=getSharedPreferences("user.xml",Activity.MODE_PRIVATE);
    login.setOnClickListener(new OnClickListener() {
        @Override
    public void onClick(View v) {
        // TODO Auto-generated method stub
        String user=username.getText().toString();
        String pass=password.getText().toString();
    if(isPassword.isChecked()){
        Editor editor=sp.edit();
        editor.putString("username",user);
        editor.putString("password",pass);
        editor.commit();
        }
    }
});

    if(isPassword.isChecked()){
        username.setText(sp.getString("username",""));
        password.setText(sp.getString("password",""));
        }
    }
}
```











