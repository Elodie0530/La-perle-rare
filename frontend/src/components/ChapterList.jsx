import { useEffect, useState } from "react";

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

  // const Chapter() => {
  //   if (setIndex != % 2 === 0 || index[12]) {
  //     return {chapters}};
  //   else (setIndex % 2 === 0) {
  //     return {chaptersIndex[0]};
  //   };
  // };

  return (
    currentChapter && (
      <>
        <p>{currentChapter.title}</p>
        <p>{currentChapter.chapter}</p>
        <img
          src={`${import.meta.env.VITE_BACKEND_URL}${currentChapter.image}`}
          alt="`aucunes images"
        />
        {currentChapter.actions.map((action) => (
          <button
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
