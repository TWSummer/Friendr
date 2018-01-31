import merge from 'lodash/merge';
import {RECEIVE_USER} from '../actions/session_actions';

const sessionReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_USER:
      return {currentUser: action.user };
    default:
      return state;
  }
};

export default sessionReducer;
