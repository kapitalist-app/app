import 'dart:async';
import 'package:flutter/material.dart';

import 'package:business/business.dart';

import 'package:client/types.dart';
import 'package:client/util.dart';
import 'package:client/common/logo.dart';

class OnboardingPage extends StatefulWidget {
  // Required
  final BaseUrlCallback onSetBaseUrl;
  final AuthCallback onDoAuth;
  final VoidCallback onOnboardingDone;

  // Optional
  final FormFieldValidator urlValidator;
  final FormFieldValidator emailValidator;
  final FormFieldValidator passwordValidator;

  OnboardingPage({
    Key key,
    @required this.onSetBaseUrl,
    @required this.onDoAuth,
    @required this.onOnboardingDone,
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
  Widget build(BuildContext ctx) {
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
          widget.urlValidator,
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
          widget.emailValidator,
          icon: Icons.email,
          inputType: TextInputType.emailAddress,
        )),
        _padTextField(UiUtil.buildTextFormField(
          _keyPassword,
          'Password',
          widget.passwordValidator,
          icon: Icons.vpn_key,
          obscure: true,
        )),
        UiUtil.emptyExpanded(),
        _buildButton(_clickSignupLoginButton, false, text: buttonText),
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

    return await this.widget.onSetBaseUrl(Uri.parse(_keyUrl.currentState.value));
  }

  Future<bool> _clickSignupLoginButton() async {
    if (_keyEmail.currentState == null ||
        _keyPassword.currentState == null ||
        !_keyEmail.currentState.validate() ||
        !_keyPassword.currentState.validate()) {
      return false;
    }

    final data = AuthData((b) => b
      ..email = _keyEmail.currentState.value
      ..password = _keyPassword.currentState.value);

    return await this.widget.onDoAuth(_signupState, data);
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
            this.widget.onOnboardingDone();
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
}
