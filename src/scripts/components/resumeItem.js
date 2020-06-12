export default class ResumeItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { content } = this.props;
    return (
      <p>{content.title}</p>
    );
  }
}
