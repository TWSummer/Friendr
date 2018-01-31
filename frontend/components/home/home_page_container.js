import HomePage from './home_page';
import { connect } from 'react-redux';
import { login, signup } from '../../actions/session_actions';

const mapStateToProps = (state, ownProps) => {
  return ({
    errors: state.errors.session
  });
};

const mapDispatchToProps = (dispatch, ownProps) => {

  return ({
    login: (formUser) => dispatch(login(formUser)),
    signup: (formUser) => dispatch(signup(formUser))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HomePage);
