.class public Fact
.super java/lang/Object
.method public static fact(I)I
.limit locals 1
.limit stack 3
iload 0
ldc 1
if_icmpgt false
ldc 1
ireturn
false:
iload 0
iload 0
ldc 1
isub
invokestatic Fact/fact(I)I
imul
ireturn
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
.method public static  main([Ljava/lang/String;)V
.limit locals 1
.limit stack 3
aload 0
iconst_0
aaload
invokestatic java/lang/Integer/parseInt(Ljava/lang/String;)I
invokestatic Fact/fact(I)I
invokestatic Fact/print(I)V
return
.end method
