package something;

import android.app.Fragment;

abstract public class LifeCircleVerticalGridSupportFragment extends Fragment {

    // only for the fragment onResume onPause determine.
    private Boolean isStarted = false;
    private Boolean isVisible = false;


    @Override
    public void onStart() {
        super.onStart();
        isStarted = true;
        if (isVisible && isStarted) {
            viewDidAppear();
        }
    }

    @Override
    public void onStop() {
        super.onStop();
        isStarted = false;
        if (isVisible)
            viewDidDisappear();
    }

    @Override
    public void setUserVisibleHint(boolean isVisibleToUser) {
        super.setUserVisibleHint(isVisibleToUser);
        isVisible = isVisibleToUser;
        if (isStarted && isVisible) {
            viewDidAppear();
        }
        if (!isVisible && isStarted) {
            viewDidDisappear();
        }
    }

    abstract void viewDidAppear();

    abstract void viewDidDisappear();
}
