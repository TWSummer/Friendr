import * as APIUtil from '../util/search_util';

export const RECEIVE_SEARCH = 'RECEIVE_SEARCH';
export const RECEIVE_SEARCH_ERRORS = 'RECEIVE_SEARCH_ERRORS';

const receiveSearch = search => ({
  type: RECEIVE_SEARCH,
  search
});

const receiveErrors = errors => ({
  type: RECEIVE_SEARCH_ERRORS,
  errors
});

export const fetchSearch = () => dispatch => (
  APIUtil.fetchSearch()
    .then(
      search => dispatch(receiveSearch(search)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);


export const updateSearch = formSearch => dispatch => (
  APIUtil.updateSearch(formSearch)
    .then(
      search => dispatch(receiveSearch(search)),
      errors => dispatch(receiveErrors(errors.responseJSON))
    )
);
