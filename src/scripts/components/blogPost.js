export default class BlogPost extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { content } = this.props;
    return (
      <div className='blogPost'>
        <h3>{content.title}</h3>
        <div>{new Date(content.date).toLocaleDateString()}</div>
        <div>
          {content.paragraphs.map(text => {
            return (
              <p>{text}</p>
            );
          })}
        </div>
        <div>
          <span>Tags:</span>
          {content.tags.map(tag => {
            return (
              <small>{tag}</small>
            );
          })}
        </div>
      </div>
    );
  }
}
