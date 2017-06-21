import React from 'react';
import { NavLink } from 'react-router-dom';

class SignupForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			username: "",
			password: ""
		};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  handleChange(field) {
    return (e) => { this.setState({[field]: e.target.value});
  };

  }
  render() {
    return (
      <form className="auth-form signup-form" onSubmit={this.handleSubmit}>
        <label><NavLink to="/">╳</NavLink></label>
        <label>
          <input
						placeholder="Username"
						onChange={this.handleChange('username')}
						value={this.state.username}
						className={`${this.props.errors.username ? 'invalid' : ''}`}
					/>
					<span className="errors" >{this.props.errors.username}</span>
        </label>
        <label>
          <input
						placeholder="Password"
						type='password'
						onChange={this.handleChange('password')}
						className={`${this.props.errors.password ? 'invalid' : ''}`}
						value={this.state.password}
					/>
					<span className="errors" >{this.props.errors.password}</span>
        </label>
        <button className="btn">Sign Up</button>
				<hr />
				<div className="alt-form">
					<span>Already have an ------ account?</span>
					<NavLink to="/login" className="green-link">Log in</NavLink>
				</div>
      </form>
  );
  }
}

export default SignupForm;