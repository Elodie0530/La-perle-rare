import React from "react";
import ChapterList from "./components/ChapterList";
import "./App.css";
import Navbar from "./components/Navbar";

function App() {
  return (
    <div className="App">
      <Navbar />
      <p>Hello World Reims</p>

      <ChapterList />
    </div>
  );
}

export default App;
