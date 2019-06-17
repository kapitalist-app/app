import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:kapitalist/models/register_login_data.dart';
import 'package:kapitalist/redux/app/app_state.dart';
import 'package:kapitalist/redux/auth/auth_actions.dart';
import 'package:kapitalist/redux/common/common_actions.dart';
import 'package:kapitalist/routes.dart';
import 'package:kapitalist/ui/logo.dart';
import 'package:kapitalist/ui/util.dart';

typedef ValidationCallback = Future<bool> Function();

class OnboardingPage extends StatefulWidget {
  final FormFieldValidator urlValidator;
  final FormFieldValidator emailValidator;
  final FormFieldValidator passwordValidator;

  OnboardingPage({
    Key key,
    this.urlValidator,
    this.emailValidator,
    this.passwordValidator,
  }) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Pages can't be const because we call setState in the callbacks
  static List<Widget> pages;

  // FormKeys for the textfields
  final _keyUrl = GlobalKey<FormFieldState<String>>();
  final _keyEmail = GlobalKey<FormFieldState<String>>();
  final _keyPassword = GlobalKey<FormFieldState<String>>();

  // Current page index
  int _idx = 0;
  // Signup state
  AuthType _signupState = AuthType.REGISTER;
  // Stream subscription to the Store
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    pages = [
      _buildHelloPage(),
      _buildUrlPage(),
      _buildSignupLoginPage(),
      _buildFinalPage(),
    ];
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    if (_subscription == null) {
      final store = StoreProvider.of<AppState>(context);
      _subscription = store.onChange.listen((data) {
        // If we are logged in..
        if (data.authState.loggedIn) {
          // ..and onboarding was already done -> Navigate to MainPage
          if (data.onboardingDone) {
            debugPrint(
                "Login from existing credentials -> Navigating to MainPage");
            final navigator = Navigator.of(context);
            navigator.pushReplacementNamed(KapitalistRoutes.HOME);
          }
          // ..and onboarding was not done -> Show final page
          else {
            debugPrint("Login in onboarding -> Showing final page");
            setState(() {
              _idx = 3;
            });
          }
        }
        // If the baseUrl is set => Move to login/register page once(!)
        else if (data.apiState.baseUrl != null && _idx != 2) {
          debugPrint("BaseUrl is/was set -> Skipping selection screen");
          setState(() {
            _idx = 2;
          });
        }
      });
    }

    return Scaffold(
      body: Container(
        color: Colors.green,
        child: pages[_idx],
      ),
    );
  }

  // Pages
  Widget _buildHelloPage() {
    return Column(
      children: <Widget>[
        _buildLogoHeader(),
        _buildTitle('Welcome to the Kapitalist App!'),
        _buildDescription(
            'We will now set you up to start tracking your finances.'),
        UiUtil.emptyExpanded(),
        _buildButton(() async {
          return true;
        }, false),
      ],
    );
  }

  Widget _buildUrlPage() {
    return Column(
      children: <Widget>[
        _buildLogoHeader(),
        _buildTitle('Kapitalist Url'),
        _buildDescription('Where can we reach your Kapitalist instance?'),
        _padTextField(UiUtil.buildTextFormField(
          _keyUrl,
          'Kapitalist URL',
          widget.urlValidator ?? _validateUrl,
          icon: Icons.cloud_queue,
        )),
        UiUtil.emptyExpanded(),
        _buildButton(_clickUrlButton, false),
      ],
    );
  }

  Widget _buildSignupLoginPage() {
    // TODO: Add a way to switch between modes

    var title = _signupState == AuthType.REGISTER
        ? 'Register new account'
        : 'Login to your existing account';
    var description = _signupState == AuthType.REGISTER
        ? 'Tell us something about yourself..'
        : 'Welcome back, please enter your credentials';
    var buttonText =
        _signupState == AuthType.REGISTER ? 'Register' : 'Login';

    return Column(
      children: <Widget>[
        _buildLogoHeader(),
        _buildTitle(title),
        _buildDescription(description),
        _padTextField(UiUtil.buildTextFormField(
          _keyEmail,
          'Email',
          widget.emailValidator ?? _validateEmail,
          icon: Icons.email,
          inputType: TextInputType.emailAddress,
        )),
        _padTextField(UiUtil.buildTextFormField(
          _keyPassword,
          'Password',
          widget.passwordValidator ?? _validatePassword,
          icon: Icons.vpn_key,
          obscure: true,
        )),
        UiUtil.emptyExpanded(),
        _buildButton(_clickSignupLoginButton, true, text: buttonText),
      ],
    );
  }

  Widget _buildFinalPage() {
    return Column(
      children: <Widget>[
        _buildLogoHeader(),
        _buildTitle('You are all set!'),
        _buildDescription(
            'Click finish to start tracking your finances'),
        UiUtil.emptyExpanded(),
        _buildButton(() async {
          return true;
        }, true),
      ],
    );
  }

  Future<bool> _clickUrlButton() async {
    if (_keyUrl.currentState == null || !_keyUrl.currentState.validate()) {
      return false;
    }

    final store = StoreProvider.of<AppState>(context);
    // XXX: This might throw
    store.dispatch(SetBaseUrlAction(Uri.parse(_keyUrl.currentState.value)));

    // XXX: We need to wait for the change to take effect, so we return false
    return false;
  }

  Future<bool> _clickSignupLoginButton() async {
    if (_keyEmail.currentState == null ||
        _keyPassword.currentState == null ||
        !_keyEmail.currentState.validate() ||
        !_keyPassword.currentState.validate()) {
      return false;
    }

    final data = RegisterLoginData((b) => b
      ..email = _keyEmail.currentState.value
      ..password = _keyPassword.currentState.value);

    final store = StoreProvider.of<AppState>(context);
    store.dispatch(DoAuthAction(_signupState, data));

    // Always return false, because we wait for the authentication to succeed
    return false;
  }

  // Page base parts
  Widget _buildLogoHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 60.0,
        child: KapitalistLogo(),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
      child: Text(
        title,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          fontFamily: "OpenSans",
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        description,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          fontFamily: "OpenSans",
        ),
      ),
    );
  }

  Widget _buildButton(ValidationCallback isValid, bool atEnd, {String text}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlineButton(
        child: Text(text ?? (!atEnd ? 'Next' : 'Finish')),
        onPressed: () async {
          bool valid = await isValid();
          // If validation fails, stay on page
          if (!valid) {
            return;
          }
          if (!atEnd) {
            // If we are not the last page, increment index
            setState(() {
              _idx += 1;
            });
          }
          else {
            // Else just navigate to HomePage
            final store = StoreProvider.of<AppState>(context);
            store.dispatch(OnboardingDoneAction());
            Navigator.of(context).pushReplacementNamed(KapitalistRoutes.HOME);
          }
        },
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 100),
        textColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        highlightedBorderColor: Colors.white,
        highlightColor: Colors.lightGreen,
      ),
    );
  }

  // Util
  Widget _padTextField(Widget textfield) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: textfield,
    );
  }

  // Validation
  String _validateUrl(String url) {
    debugPrint('url: $url');
    return !url.contains('https') ? 'Url invalid' : null;
  }

  String _validateEmail(String email) {
    debugPrint('email: $email');
    return !email.contains('@') ? 'Invalid email address' : null;
  }

  String _validatePassword(String password) {
    debugPrint('password: $password');
    return null;
  }
}
