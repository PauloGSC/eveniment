'use strict'

class UserSrv {

	constructor(repository) {
    this.repository = repository;
  }

  async create(model) {
    try {
      const columns = Object.keys(model);
      const data = columns.map(key => typeof model[key] == 'string' ? `"${model[key]}"` : model[key] );
      
      const query = `INSERT INTO user (${columns.join(',')})` + 
        ` VALUES (` + data.join(',') +  `)`;
      console.log(query);
      const [response] = await this.repository.execute(query);

      return response.insertId;
    } catch(err) {
      return err;
    }
  }
}

module.exports = UserSrv;
