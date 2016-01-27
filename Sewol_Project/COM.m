function [comx, comy] = COM(mShip, mCar, mBox, comShip, comCar, comBox)

    comx = (mShip*comShip(1) + mBox*comBox(1) + mCar*comCar(1))/(mShip+mBox+mCar);
    comy = (mShip*comShip(2) + mBox*comBox(2) + mCar*comCar(2))/(mShip+mBox+mCar);

end