import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('تسجيل الدخول'),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 0;
  String _email = '';
  String _vehicleType = '';
  double _maxWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'الاسم'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال الاسم';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'العمر'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال العمر';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty || !value.contains('@')) {
                return 'يرجى إدخال بريد إلكتروني صحيح';
              }
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'نوع المركبة'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال نوع المركبة';
              }
              return null;
            },
            onSaved: (value) {
              _vehicleType = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'نوع المركبة'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'يرجى إدخال نوع المركبة';
              }
              return null;
            },
            onSaved: (value) {
              _vehicleType = value!;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // يمكنك هنا استخدام البيانات المدخلة بالطريقة التي تحتاجها
                print('تم تسجيل الدخول بنجاح!');
              }
            },
            child: Text('تسجيل الدخول'),
          ),
        ],
      ),
    );
  }
}







class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login & Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSignupScreen(),
    );
  }
}

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogin = true;

  // Form Fields
  String _name = '';
  int _age = 0;
  String _email = '';
  String _vehicleType = '';
  double _maxWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (!_isLogin)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                if (!_isLogin)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _age = int.parse(value!);
                    },
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vehicle Type'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your vehicle type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vehicleType = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Max Weight'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the max weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _maxWeight = double.parse(value!);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  onPressed: _toggleMode,
                  child: Text(_isLogin
                      ? 'Create an account'
                      : 'Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    // Here you can use the entered values (_name, _age, _email, _vehicleType, _maxWeight)
    // For now, just print them
    print('Name: $_name');
    print('Age: $_age');
    print('Email: $_email');
    print('Vehicle Type: $_vehicleType');
    print('Max Weight: $_maxWeight');

    // Clear form fields
    _formKey.currentState!.reset();
  }
}


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLogin = true;

  // Form Fields
  String _name = '';
  int _age = 0;
  String _email = '';
  String _vehicleType = '';
  double _maxWeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (!_isLogin)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                if (!_isLogin)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _age = int.parse(value!);
                    },
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Vehicle Type'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your vehicle type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _vehicleType = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Max Weight'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the max weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _maxWeight = double.parse(value!);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isLogin ? 'Login' : 'Sign Up'),
                ),
                TextButton(
                  onPressed: () {  },
                  child: Text(_isLogin
                      ? 'Create an account'
                      : 'Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    // Here you can use the entered values (_name, _age, _email, _vehicleType, _maxWeight)
    // For now, just print them
    print('Name: $_name');
    print('Age: $_age');
    print('Email: $_email');
    print('Vehicle Type: $_vehicleType');
    print('Max Weight: $_maxWeight');

    // Clear form fields
    _formKey.currentState!.reset();
  }