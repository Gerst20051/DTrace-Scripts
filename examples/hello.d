/* [$]> sudo dtrace -s hello.d */

BEGIN
{
	trace("hello, world");
	exit(0);
}
