import React from "react";
import ReactDOM from "react-dom";

import configureStore from './store/store'
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from "./actions/pokemon_actions"
import {selectAllPokemon} from './reducers/selectors'
import Root from './components/root'

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    const store = configureStore()

    window.dispatch = store.dispatch
    window.getState = store.getState;
    window.fetchAllPokemon = fetchAllPokemon;
    window.receiveAllPokemon = receiveAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon

    ReactDOM.render(<Root store={store} />, root);
});