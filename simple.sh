gfortran simple.f90
./a.out 

session='plot'

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'plot0'
tmux send-keys -t $session:$window 'xmgrace xt' C-m

window=1
tmux new-window -t $session:$window -n 'plot1'
tmux send-keys -t $session:$window 'xmgrace vt' C-m

window=2
tmux new-window -t $session:$window -n 'plot2'
tmux send-keys -t $session:$window 'xmgrace vx' C-m

window=3
tmux new-window -t $session:$window -n 'plot3'
tmux send-keys -t $session:$window 'xmgrace xw' C-m

tmux attach-session -t $session
