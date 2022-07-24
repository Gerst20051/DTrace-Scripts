/*
 * Use DTrace to observe every time the shell performs a read(2) or write(2) system call.
 * First, open two terminal windows, one to use for DTrace and the other containing the shell process you're going to watch.
 * In the second window, type the following command to obtain the process ID of this shell:
 * [$]> echo $$
 * Replace 12345 with the process ID of the shell that was printed in response to the echo command.
 * [$]> sudo dtrace -s rw.d
 */

syscall::read:entry,
syscall::write:entry
/pid == 12345/
{

}
