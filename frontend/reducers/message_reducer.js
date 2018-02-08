import merge from 'lodash/merge';
import { RECEIVE_MESSAGE, RECEIVE_MESSAGES } from '../actions/message_actions';

const messageReducer = (state = [], action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_MESSAGES:
      return action.messages;
    case RECEIVE_MESSAGE:
      let newArr = state.slice(0);
      newArr.push(action.message);
      return newArr;
    default:
      return state;
  }
};

export default messageReducer;
