from fastapi import HTTPException, Header
import jwt


def auth_middleware(x_auth_token=Header()):
    try:
        # get the user token from the header
        if not x_auth_token:
            raise HTTPException(401, 'User with this email does not exist!')
        # decode the token
        verified_token = jwt.decode(
            x_auth_token, 'password_key', algorithms=['HS256'])
        if not verified_token:
            raise HTTPException(401, 'token verification failed')

        # get the id from the token
        uid = verified_token.get('id')
        return {'uid': uid, 'token': x_auth_token}
        # postgress database  get the user infos
    except jwt.PyJWTError:
        raise HTTPException(401, 'token is not valid')
