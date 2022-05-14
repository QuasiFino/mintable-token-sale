import { 
  CHECK_DATA_REQUEST, 
  CHECK_DATA_SUCCESS, 
  CHECK_DATA_FAILED 
} from "../ActionTypes";

import store from "../store";

export const DataActionCreators = {
  fetchDataRequest: () => ({ type: CHECK_DATA_REQUEST }),
  fetchDataSuccess: payload => ({ type: CHECK_DATA_SUCCESS, payload }),
  fetchDataFailed: payload => ({ type: CHECK_DATA_FAILED, payload }),
}

export const fetchData = (account) => async dispatch => {
  const { fetchDataRequest, fetchDataSuccess, fetchDataFailed } = DataActionCreators;
  dispatch(fetchDataRequest());
  try {
    let tokenBalance = await store
      .getState()
      .blockchain.myToken.methods.balanceOf(account)
      .call();
    let kycCompleted = await store
      .getState()
      .blockchain.kycContract.methods.kycCompleted(account)
      .call();
    let totalSupply = await store
      .getState()
      .blockchain.myToken.methods.totalSupply()
      .call();
    dispatch(fetchDataSuccess({ tokenBalance, kycCompleted, totalSupply }));
  } catch (err) {
    console.log(err);
    dispatch(fetchDataFailed("Could not load data from contract."));
  }
}
