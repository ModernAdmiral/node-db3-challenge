const knex = require("knex");
const config = require("../knexfile.js");
const db = knex(config.development);

const find = () => {
  return db("schemes"); // return master list of schemes
};

const findById = id => {
  return db("schemes")
    .where({ id })
    .first(); //Target specific user in db, or an empty array if it doesnt exist
};

module.exports = {
  find,
  findById
  //   findSteps,
  //   add,
  //   update,
  //   remove
};
