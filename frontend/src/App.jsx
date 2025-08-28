import React from 'react';
import Header from './components/Header';
import Footer from './components/Footer';

function App() {
  return (
    <div className="App">
      <Header />
      <main>
        <h1>Test Frontend Application</h1>
        <p>This is a test application for Buildkite if_changed functionality.</p>
      </main>
      <Footer />
    </div>
  );
}

export default App;
