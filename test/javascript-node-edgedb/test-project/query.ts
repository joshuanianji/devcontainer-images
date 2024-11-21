import * as edgedb from "edgedb";

const client = edgedb.createClient();

async function main() {
    const result = await client.querySingle(`
    select Movie {
      title,
      actors: {
        name,
      }
    } filter .title = "Iron Man 2"
  `);

    console.log(JSON.stringify(result, null, 2));
}

main();
