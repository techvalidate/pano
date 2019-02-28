import React, { Component, Fragment } from 'react';
import { Modal, Button, ModalBody } from '@sm/wds-react';

export default class ModalDefault extends Component {

  state = { show: false };

  handleOnClick = () => {
    const show = this.state.show;
    this.setState({ show: !show });
  }

  render() {
    return (
      <Fragment>
        <Button onClick={this.handleOnClick}>SHOW</Button>
        <Modal show={this.state.show} onClose={this.handleOnClick}>
          <ModalBody>
            {this.props.text}
          </ModalBody>
        </Modal>
      </Fragment>
    );
  }
}