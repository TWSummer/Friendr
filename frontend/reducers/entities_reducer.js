import { combineReducers } from 'redux';
import profileReducer from './profile_reducer';
import searchReducer from './search_reducer';
import messageReducer from './message_reducer';

const entitiesReducer = combineReducers({
  profiles: profileReducer,
  search: searchReducer,
  messages: messageReducer
});

export default entitiesReducer;
