const componentSelector = '#resume';

class Resume extends React.Component {
  constructor(props) {
    super(props);
  }

  state = {
    loading: true,
    resumeSections: []
  };

  componentDidMount() {
    this._getResumeSections();
  }

  _getResumeSections = () => {
    axios.get('/api/resume').then(response => {
      console.log('response', response.data.sections;
    })
  };

  render() {
    const content = "test content";
    return (
      <div>
        <p>This is the resume.</p>
      </div>
    );
  }
}

ReactDOM.render(React.createElement(Resume), document.querySelector(componentSelector));