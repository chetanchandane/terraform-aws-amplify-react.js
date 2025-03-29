import React, { useState } from 'react';
import { Amplify, Auth } from 'aws-amplify';

Amplify.configure({
  Auth: {
    region: 'us-east-1',
    userPoolId: process.env.REACT_APP_USER_POOL_ID,
    userPoolWebClientId: process.env.REACT_APP_USER_POOL_CLIENT_ID,
  }
});

function App() {
  const [message, setMessage] = useState('');

  const loginAndCallAPI = async () => {
    try {
      const user = await Auth.signIn('testuser', 'TestPassword123!');
      const session = await Auth.currentSession();
      const token = session.getIdToken().getJwtToken();

      const res = await fetch(`${process.env.REACT_APP_API_BASE_URL}/hello`, {
        headers: {
          Authorization: `Bearer ${token}`
        }
      });

      const data = await res.json();
      setMessage(data.message);
    } catch (err) {
      console.error(err);
      setMessage('Error calling API.');
    }
  };

  return (
    <div>
      <h1>Amplify + Cognito + API Gateway Demo</h1>
      <button onClick={loginAndCallAPI}>Login & Fetch</button>
      <p>{message}</p>
    </div>
  );
}

export default App;
