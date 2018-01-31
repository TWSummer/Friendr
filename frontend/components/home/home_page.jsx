import React from 'react';
import { Link } from 'react-router-dom';
import AuthForm from './auth_form';

class HomePage extends React.Component {
  constructor(props) {
    super(props);
    this.state={form: ""};
  }

  showForm(type) {
    return () => this.setState({form: type});
  }

  render() {
    let form;
    if (this.state.form === "login") {
      form = <AuthForm formType="Log In" action={this.props.login} />;
    } else if (this.state.form === "signup") {
      form = <AuthForm formType="Sign Up" action={this.props.signup} />;
    }
    return (
      <div>
        <header className="home-header">
          <button onClick={this.showForm("login").bind(this)} className="auth-button">Log In</button>
          <button onClick={this.showForm("signup").bind(this)} className="auth-button">Sign Up</button>
        </header>
        {form}
      </div>
    );
  }
}

export default HomePage;
