const jwt = require('jsonwebtoken');
const User = require('../models/User');

exports.signup = async (req, res) => {
  try {
    const userExist = await User.findOne({ email: req.body.email });
    if (userExist) {
      return res.status(400).json({ message: 'User already exist' });
    }
    const { firstName, lastName, email, password } = req.body;
    const _user = new User({
      firstName,
      lastName,
      email,
      password,
      userName: Math.random().toString(),
    });
    const user = await _user.save();
    if (!user) return res.status(400).json({ message: 'something went wrong' });
    console.log('you reach here');
    return res.status(201).json({
      message: 'user successfully created',
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.signin = async (req, res) => {
  try {
    const userExist = User.findOne({ email: req.body.email });
    if (!userExist)
      return res.status(400).json({ message: 'user does not exit' });
    if (userExit.authenticate(req.body.password)) {
      const token = jwt.sign(
        { _id: user._id, role: user.role },
        process.env.KEY,
        {
          expiresIn: '20h',
        }
      );
      const { firstName, lastName, fullName, email } = userExist;
      res.status(201).json({
        token,
        user: { firstName, lastName, fullName, email },
      });
    } else {
      return res
        .status(400)
        .json({ message: 'invalid password or username/email' });
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

exports.requireSignin = (req, res, next) => {
  const token = req.headers.authorization.split(' ')[1];
  user = jwt.verify(token, process.env.KEY);
  req.user = user;
  next();
};
