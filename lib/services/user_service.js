const otpGenerator = require("otp-generator");
const crypto = require(crypto);
const key = "otp-secret-key";

async function createOTP(params, callback){
    const otp =  otpGenerator.generate(4, {
        lowerCaseAlphabets: false,
        upperCaseAlphabets: false,
        specialChars: false,
        
    });

    const ttl = 5*60*1000; // expire in 5 min
    const expires = Date.now()+ttl;
    const data = `${params.phone}.${otp}.${expires}`;
    const hash = crypto.createHmac("sha256", key).update(data).digest("hex");
    const fullHash = `${hash}.${expires}`;

    console.log(`Your OTP is ${otp}`);

    // SEND SMS
    return callback(null, fullHash);
}

async function verifyOTP (params, callback){
    let [hashValue, expires] = params.hash.split('.');

    let now = Date.now();
    if(now > parseInt(expires)) return callback("OTP Expired");

    let data = `${params.phone}.${params.otp}.${expires}`;
    let newCalulateHash = crypto 
    .createHmac("sha256", key )
    .update(data)
    .digest("hex");

    if (newCalulateHash === hashValue) {
        return callback(null, "Success");
    }

    return callback("Invalid OTP");
}

module.exports = {
    createOTP,
    verifyOTP,
}