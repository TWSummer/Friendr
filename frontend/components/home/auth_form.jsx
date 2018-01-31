import React from 'react';

class AuthForm extends React.Component {
  constructor(props) {
    super(props);
    this.state={username: "", password: ""};
  }

  render() {
    return (
      <div className="auth-form">
        <h1>{this.props.formType}</h1>
        <form>
          <label>Username
            <input type="text" value={this.state.username} />
          </label>
          <br />
          <label>Password
            <input type="password" value={this.state.password} />
          </label>
          <br />
          <input type="submit" value={this.props.formType} />
        </form>
      </div>
    );
  }
}

export default AuthForm;
