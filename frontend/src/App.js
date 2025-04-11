import React, { useState } from 'react';
import { Amplify } from 'aws-amplify';
import awsconfig from './aws-exports';
import { Authenticator, AmplifySignOut, withAuthenticator  } from '@aws-amplify/ui-react';

Amplify.configure(awsconfig);

function App() {

  return (
    <Authenticator>
      <div>
        <header className="App-header">
          <h1>Welcome to the Amplify App</h1>
          <p>This is a simple application using AWS Amplify.</p>
          <AmplifySignOut />
        </header>
    </div>
    </Authenticator>
  );
}

export default withAuthenticator(App);
