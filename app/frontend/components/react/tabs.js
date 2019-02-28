import React, { Fragment, useState } from 'react';
import { PageHeader, Tabs, Tab } from '@sm/wds-react';


export default () => {

  const [selected, setSelected] = useState(0)

  return (
    <Fragment>
      <Tabs onChange={() => setSelected(selected)} >
        <Tab selected title='EDIT'>Edit Content</Tab>
        <Tab title='OPTIONS' />
        <Tab title='LOGIC' />
        <Tab title='COPY' />
      </Tabs>
    </Fragment>
  )
}