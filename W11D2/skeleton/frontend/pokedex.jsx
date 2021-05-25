import React from "react";
import ReactDOM from "react-dom";

import { fetchAllPokemon } from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');

    window.fetchAllPokemon = fetchAllPokemon;

    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});