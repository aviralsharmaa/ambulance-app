exports.otpLogin = (req,res,next) => {
    userServices.createOTP(req.body, (error, results) => {
        if(error){
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results
        })
    });
}

exports.verifyOTP = (req, res, next) => {
    userServices.verifyOTP(req.body, (error, results)=>{
        if(error){
            return next(error);
        }
        return res.status(200).send({
            message: "Success",
            data: results
        })
    });
}