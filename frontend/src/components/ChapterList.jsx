import { useEffect, useState } from "react";
import "./ChapterList.css";

function ChapterList() {
  const [chapters, setChapters] = useState();
  const [currentChapter, setCurrentChapter] = useState();

  useEffect(() => {
    fetch(
      `${import.meta.env.VITE_BACKEND_URL ?? "http://localhost:6000"}/chapters`
    )
      .then((response) => response.json())
      .then((data) => {
        setChapters(data);
        setCurrentChapter(data.find((chapter) => chapter.is_first));
      })

      .catch((err) => {
        console.error(err);
      });
  }, []);

  return (
    currentChapter && (
      <>
        <p>{currentChapter.title}</p>
        <p>{currentChapter.chapter}</p>
        <img
          src={`${import.meta.env.VITE_BACKEND_URL}${currentChapter.image}`}
          alt="`images du chapitre"
        />
        {currentChapter.actions.map((action) => (
          <button
            className="buttons"
            type="button"
            onClick={() => {
              setCurrentChapter(
                chapters.find((chapter) => chapter.id === action.id)
              );
            }}
          >
            {action.name}
          </button>
        ))}
      </>
    )
  );
}

export default ChapterList;
