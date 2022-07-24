/*
 * Use DTrace to observe every time the shell performs a read(2) or write(2) system call.
 * [$]> sudo dtrace -q -s trussrw.d 12345
 */

syscall::read:entry,
syscall::write:entry
/pid == $1/
{
	printf("%s(%d, 0x%x, %4d)", probefunc, arg0, arg1, arg2);
}

syscall::read:return,
syscall::write:return
/pid == $1/
{
	printf("\t\t = %d\n", arg1);
}
