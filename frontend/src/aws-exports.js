const awsconfig = {
    Auth: {
      region: process.env.REACT_APP_REGION || 'us-east-1',
      userPoolId: process.env.REACT_APP_USER_POOL_ID,
      userPoolClientId: process.env.REACT_APP_USER_POOL_CLIENT_ID,
      Cognito: {
        loginWith: {} 
      }
    }
  };
  
  export default awsconfig;