const express = require('express');
const User = require('../models/User');
const { signin, signup } = require('../controllers/auth');
const router = express.Router();

router.post('/signup', signup);

router.post('/signin', signin);

module.exports = router;
