const Scheme = require("./scheme-model");

/*
  If `scheme_id` does not exist in the database:

  status 404
  {
    "message": "scheme with scheme_id <actual id> not found"
  }
*/
const checkSchemeId = async (req, res, next) => {
  try {
    const { scheme_id } = req.params;
    const scheme = await Scheme.findById(scheme_id);
    if (typeof scheme === "undefined") {
      next({
        status: 404,
        message: `scheme with scheme_id ${scheme_id} not found`
      });
    } else {
      next();
    }
  } catch (err) {
    next(err);
  }
};

/*
  If `scheme_name` is missing, empty string or not a string:

  status 400
  {
    "message": "invalid scheme_name"
  }
*/
const validateScheme = async (req, res, next) => {
  try {
    const { scheme_name } = req.body;
    if (typeof scheme_name !== "string" || scheme_name.length === 0) {
      next({
        status: 400,
        message: "invalid scheme_name"
      });
    } else {
      next();
    }
  } catch (err) {
    next(err);
  }
};

/*
  If `instructions` is missing, empty string or not a string, or
  if `step_number` is not a number or is smaller than one:

  status 400
  {
    "message": "invalid step"
  }
*/
const validateStep = (req, res, next) => {

};

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
};
