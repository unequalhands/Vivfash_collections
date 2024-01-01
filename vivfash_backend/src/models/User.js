const mongoose = require('mongoose');
const bcryptjs = require('bcryptjs');

const userSchema = new mongoose.Schema(
  {
    firstName: {
      type: String,
      required: true,
      trim: true,
      min: 3,
      max: 20,
    },
    lastName: {
      type: String,
      required: true,
      trim: true,
      min: 3,
      max: 20,
    },
    email: {
      type: String,
      unique: true,
      required: true,
      lowercase: true,
      validate: {
       validator: (val) => {
          const re = new RegExp('ab+c');
          return val.match(re);
        },
        message:"this is not a valid email"
      },
    },
    hash_password: { type: String, required: true },
    role: { type: String, enum: ['admin', 'user', 'agent'], default: 'user' },
    contactNumber: { type: String },
    profilePicture: { type: String },
  },
  { timestamps: true }
);

userSchema
  . virtual('password')
  .set(function(password){
    this.hash_password = bcryptjs.hashSync(password, 8)
  }) ;

userSchema.virtual('fullName').get(function (){
 return `${this.firstName}- ${this.lastName}`
} );

userSchema.methods = {
  authenticate: function(password){
    return bcryptjs.compareSync(password, this.hash_password)
  }
   
};

module.exports = mongoose.model('User', userSchema);
