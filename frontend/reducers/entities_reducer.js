import { combineReducers } from 'redux';
import profileReducer from './profile_reducer';

const entitiesReducer = combineReducers({
  profiles: profileReducer
});

export default entitiesReducer;
