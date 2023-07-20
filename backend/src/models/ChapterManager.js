const AbstractManager = require("./AbstractManager");

class ChapterManager extends AbstractManager {
  constructor() {
    super({ table: "chapter" });
  }

  findAll() {
    return this.database.query(
      `select
        chapter.*,
        JSON_ARRAYAGG(
          JSON_OBJECT(
            "name", lead_to.name,
            "id", lead_to.chapter_end_id
          )
        ) as actions
        from  ${this.table}
        left join lead_to on chapter.id=lead_to.chapter_start_id
        group by chapter.id`
    );
  }

  insert(chapter) {
    return this.database.query(`insert into ${this.table} (title) values (?)`, [
      chapter.title,
    ]);
  }

  update(chapter) {
    return this.database.query(
      `update ${this.table} set title = ? where id = ?`,
      [chapter.title, chapter.id]
    );
  }
}

module.exports = ChapterManager;
