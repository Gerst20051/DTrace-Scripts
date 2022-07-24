/*
 * Use DTrace to observe every time the shell performs a read(2) or write(2) system call.
 * [$]> sudo dtrace -s rwtime.d `pgrep -n sh`
 */

syscall::read:entry,
syscall::write:entry
/pid == $1/
{
	ts[probefunc] = timestamp;
}

syscall::read:return,
syscall::write:return
/pid == $1 && ts[probefunc] != 0/
{
	printf("%d nsecs", timestamp - ts[probefunc]);
}
