function buildConditions(params = {}) {
  let query = '';

  Object.keys(params).forEach((key, index) => {
    if (index == 0)
      query = ' where ' + "REGEXP_LIKE(" + key + `, "${params[key]}")`;
    else
      query = query + ' and ' + "REGEXP_LIKE(" + key + `, "${params[key]}")`;
  });

  return query;
}

module.exports = buildConditions;