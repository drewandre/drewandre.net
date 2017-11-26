import React from 'react';

const TextArea = props => {
  return (
    <label>{props.label}
      <input
        name={props.name}
        onChange={props.handlerFunction}
        type='textarea'
        value={props.content}
      />
    </label>
  );
}

export default TextArea;
