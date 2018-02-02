import React from 'react';
import { Link } from 'react-router-dom';

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: {
        id: 0,
        question: "",
        options: [],
        answerCount: 0
      }
    };
  }

  componentDidMount() {
    $.ajax({
      method: 'GET',
      url: `/api/questions`
    }).then(
      (question => this.setState({ question }))
    );
  }

  render() {
    return (
      <div className="question-page">
        <header className="question-page-header">
          <div className="question-inner-header">
            <Link to="/profile">
              <i className="fas fa-angle-left"></i>
              <img src={this.props.session.currentUser.primary_img_url} />
              <h2>{this.props.session.currentUser.name}</h2>
            </Link>
          </div>
        </header>
        <main className="question-main">
          <section className="question-section">
            <h2>Friendship Compatibility Questions</h2>
            <article>
              <h3>
                {this.state.question.question}
              </h3>
              <form>
                {
                  this.state.question.options.map( (option, idx) => (
                    <label key={option.id}>
                      <input type="radio"/>{option.body}
                      <br/>
                    </label>
                  ))
                }
                <h4>
                  My ideal friend would answer:
                </h4>
                {
                  this.state.question.options.map( (option, idx) => (
                    <label key={option.id}>
                      <input type="checkbox"/>{option.body}
                      <br/>
                    </label>
                  ))
                }
                <label>
                  <input type="checkbox"/>Any of the above
                  <br/>
                </label>
                <div className="importance-selector">
                  <div className={`importance-low`}></div>
                  <div className={`importance-med`}></div>
                  <div className={`importance-high`}></div>
                </div>
                <button>Answer</button>
                <button>Skip</button>
              </form>
            </article>
          </section>
          <aside className="question-aside">
            <div className="highest-percentage">
              <h1>{this.state.question.answerCount < 1 ? "0" : Math.round(1000 * (1.0 - 1.0/this.state.question.answerCount))/10}</h1>
              <h2>%</h2>
            </div>
            <h3>
              You've answered {this.state.question.answerCount} questions
            </h3>
        </aside>
        </main>
      </div>
    );
  }
}

export default Question;
