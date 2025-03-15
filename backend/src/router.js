const express = require("express");

const router = express.Router();

// problem deploy railway sql table item doesen't exist

/*
const itemControllers = require("./controllers/itemControllers");

router.get("/items", itemControllers.browse);
router.get("/items/:id", itemControllers.read);
router.put("/items/:id", itemControllers.edit);
router.post("/items", itemControllers.add);
router.delete("/items/:id", itemControllers.destroy);
*/

// router.get("/chapters", (req, res) => {
//   res.json({ message: "je t'enverrai les chapitres un jour" });
// });

const chapterControllers = require("./controllers/chapterControllers");

router.get("/chapters", chapterControllers.browse);
router.get("/chapters/:id", chapterControllers.read);
router.put("/chapters/:id", chapterControllers.edit);
router.post("/chapters", chapterControllers.add);
router.delete("/chapters/:id", chapterControllers.destroy);
module.exports = router;
