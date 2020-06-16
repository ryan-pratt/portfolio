export default class BlogPost extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { content } = this.props;
    return (
      <div className='blogPost'>
        <h3>{content.title}</h3>
        <div>
          {content.paragraphs.map(text => {
            return (
              <p>{text}</p>
              );
            })}
        </div>
        <div className="blogPostFoot">
          <div className='date'>{new Date(content.date).toLocaleDateString()}</div>
          <div className='tags'>
            <i class="fa fa-tags" aria-hidden="true"></i>
            {content.tags.map(tag => {
              return (
                <span>{tag}</span>
              );
            })}
          </div>
        </div>
      </div>
    );
  }
}
