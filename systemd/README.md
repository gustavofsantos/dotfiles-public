First create a symlink.

```
sudo ln -sf $(pwd)/sync-notes.service /etc/systemd/system/sync-notes.service
sudo ln -sf $(pwd)/sync-notes.timer /etc/systemd/system/sync-notes.timer

sudo ln -sf $(pwd)/notify-journal-todo.service /etc/systemd/system/notify-journal-todo.service
sudo ln -sf $(pwd)/notify-journal-todo.timer /etc/systemd/system/notify-journal-todo.timer
```

Then enable the timer

```

```
