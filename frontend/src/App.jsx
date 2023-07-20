import React from "react";
import "./App.css";
import Navbar from "./components/Navbar";
import ChapterList from "./components/ChapterList";

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
