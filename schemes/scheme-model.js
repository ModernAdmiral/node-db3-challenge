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

const findSteps = id => {
  return db("steps")
    .where({ scheme_id: id })
    .orderBy("step_number");
};

const add = scheme => {
  return db("schemes").insert(scheme);
};

const update = (changes, id) => {
  // New changes are first argument
  return db("schemes")
    .where({ id })
    .update(changes);
};

const remove = id => {
  return db("schemes")
    .where({ id })
    .del();
};

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};
