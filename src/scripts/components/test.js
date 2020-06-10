const componentSelector = '#test-component';

class Test extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <p>This is the test component</p>
    );
  }
}

ReactDOM.render(React.createElement(Test), document.querySelector(componentSelector));