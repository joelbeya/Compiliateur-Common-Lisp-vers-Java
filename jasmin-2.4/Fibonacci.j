.class public Fibonacci
.super java/lang/Object
.method public static fibo(I)I
	.limit locals 1
	.limit stack 3

	iload 0
	ldc 2
	if_icmpge recursivecall
	ldc 1
	ireturn

	recursivecall:
	iload 0
	ldc 1
	isub
	dup
	invokestatic Fibonacci/fibo(I)I
	swap
	ldc 1
	isub
	invokestatic Fibonacci/fibo(I)I
	iadd
	ireturn
.end method

.method public static print(I)V
	.limit locals 1
	.limit stack 2

	getstatic java/lang/System.out Ljava/io/PrintStream;
	iload 0
	invokevirtual java/io/PrintStream/println(I)V
	return
.end method

.method public static main([Ljava/lang/String;)V
	.limit locals 1
	.limit stack 1

	ldc 10
	invokestatic Fibonacci/fibo(I)I
	invokestatic Fibonacci/print(I)V

	return
.end method
