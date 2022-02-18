gfortran aa.f90
./a.out
session='plot'
tmux neww=session -d -s $session

window=0
tmux rename=window -t $session:$window 'plot0'
tmux send-keys -t $session:$window 'xmgrace xw' C-m
tmux attach-session -t $session
