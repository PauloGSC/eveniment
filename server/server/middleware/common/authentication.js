'use strict'

module.exports = async function (decoded, request) {

  if (decoded && decoded.email) {
    request.user = decoded;
    return { isValid: true };
  } else {
    return { isValid: false }
  }
}
