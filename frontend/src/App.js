import React, { useState } from 'react';
import { Amplify } from 'aws-amplify';
import awsconfig from './aws-exports';
import { signIn, fetchAuthSession } from 'aws-amplify/auth';

Amplify.configure(awsconfig);

function App() {
  const [message, setMessage] = useState('');

  const loginAndCallAPI = async () => {
    try {
      const user = await signIn({ username: 'testuser', password: 'TestPassword123!'});
      const session = await fetchAuthSession();
      const token = session.tokens?.idToken?.toString();

      console.log("JWT:", token);
      console.log("calling API: ",`${process.env.REACT_APP_API_BASE_URL}/hello`);

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
      {/* <button onClick={loginAndCallAPI}>Login & Fetch</button>
      <p>{message}</p> */}
    </div>
  );
}

export default App;
