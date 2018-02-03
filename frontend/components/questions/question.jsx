import React from 'react';
import { Link } from 'react-router-dom';
import { merge } from 'lodash';

class Question extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      question: {
        id: 0,
        question: "",
        options: [],
        answerCount: 0
      },
      friendAnswer: {}
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

  setImportance(num) {
    return ( (e) => {
      if(!this.state.friendAnswer[-1]) {
        this.setState({importance: num});
      }
    });
  }

  setMyAnswer(optionId) {
    return ( (e) => {
      if (e.target.value) {
        this.setState({myAnswer: optionId});
      }
    });
  }

  setFriendAnswer(optionId) {
    return ( (e) => {
      if (e.target.value) {
        let friendAnswer = merge({}, this.state.friendAnswer);
        if (friendAnswer[optionId]) {
          delete friendAnswer[optionId];
        } else {
          friendAnswer[optionId] = optionId;
        }
        this.setState({friendAnswer});
      }
    });
  }

  setAny(e) {
      if (this.state.friendAnswer[-1]) {
        this.setState({friendAnswer: {}});
      } else {
        this.setState({friendAnswer: {[-1]: -1}, importance: 0});
      }
  }

  render() {
    console.log(this.state);
    let highlightLow, highlightMed, highlightHigh, disableCheckboxes, disableImportance;
    if (this.state.importance === 1) {
      highlightLow = "importance-highlight";
    } else if (this.state.importance === 3) {
      highlightLow = "importance-highlight";
      highlightMed = "importance-highlight";
    } else if (this.state.importance === 7) {
      highlightLow = "importance-highlight";
      highlightMed = "importance-highlight";
      highlightHigh = "importance-highlight";
    }
    if (this.state.friendAnswer[-1]) {
      disableCheckboxes = "disable-checkboxes";
      disableImportance = "disable-importance";
    }
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
            <h2>Compatibility Questions</h2>
            <article className="question-article">
              <h3>
                {this.state.question.question}
              </h3>
              <form className="question-form">
                {
                  this.state.question.options.map( (option, idx) => (
                    <label
                      key={option.id}
                      className="radio-label"
                      onClick={this.setMyAnswer(option.id).bind(this)}
                      >
                      <input
                        type="radio"
                        className="radio-button"
                        name="my-answer"
                        value={option.id}
                        />
                      <span className="selected-radio"></span>
                      {option.body}<br/>
                    </label>
                  ))
                }
                <h4>
                  My ideal friend would answer:
                </h4>
                {
                  this.state.question.options.map( (option, idx) => (
                    <label key={option.id} className={`check-label ${disableCheckboxes}`}>
                      <input
                        type="checkbox"
                        className="checkbox"
                        name="friend-answer"
                        checked={this.state.friendAnswer[option.id] ? true : false}
                        disabled={this.state.friendAnswer[-1]}
                        onChange={this.setFriendAnswer(option.id).bind(this)}
                        value={option.id}
                        />
                      <span className={`checkmark ${disableCheckboxes}`}></span>
                      {option.body}<br/>
                    </label>
                  ))
                }
                <label className="check-label">
                  <input
                    type="checkbox"
                    className="checkbox"
                    name="friend-answer"
                    onChange={this.setAny.bind(this)}
                    value="-1"
                    />
                  <span className="checkmark"></span>
                  Any of the above<br/>
                </label>
                <h4>Importance</h4>
                <div className="importance-selector">
                  <div
                    className={`importance-button ${highlightLow} ${disableImportance}`}
                    onClick={this.setImportance(1).bind(this)}
                    ></div>
                  <div
                    className={`importance-button ${highlightMed} ${disableImportance}`}
                    onClick={this.setImportance(3).bind(this)}
                    ></div>
                  <div
                    className={`importance-button ${highlightHigh} ${disableImportance}`}
                    onClick={this.setImportance(7).bind(this)}
                    ></div>
                </div>
                <div className="importance-labels">
                  <p>Low</p>
                  <p>Medium</p>
                  <p>High</p>
                </div>
                <div className="answer-buttons">
                  <button className="answer-button">Answer</button>
                  <button className="skip-button">Skip</button>
                </div>
              </form>
            </article>
          </section>
          <aside className="question-aside">
            <div className="highest-percentage-outer-box">
              <div className="highest-percentage">
                <h1>{this.state.question.answerCount < 1 ? "0" : Math.round(1000 * (1.0 - 1.0/this.state.question.answerCount))/10}</h1>
                <h2>%</h2>
              </div>
              <h4>Highest Compatibility Possible</h4>
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
