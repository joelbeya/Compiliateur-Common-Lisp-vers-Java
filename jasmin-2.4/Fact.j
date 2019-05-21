.class public Fact
.super java/lang/Object
.method public static fact(Ljava/lang/Object;)Ljava/lang/Object;

  ldc 1 ; rajoute l'entier 1 sur la stack
  invokestatic java/lang/Integer.valueOf(I)Ljava/lang/Integer;
  astore 1
  aload 1
  aload 0
  invokevirtual Redefinion/supp(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  astore 1
  aload 1
  checkcast java/lang/Boolean
  astore 1
  aload 1
  invokevirtual java/lang/Boolean.booleanValue()Z
  astore 1
  aload 1
  ifeq recursivecall
  astore 1
  aload 1
  iconst_1
  invokestatic java/lang/Integer.valueOf(I)Ljava/lang/Integer;
  astore 1
  aload 1
  areturn

  recursivecall:
  aload 0
  ldc 1
  invokestatic java/lang/Integer.valueOf(I)Ljava/lang/Integer;
  astore 1
  aload 1
  invokevirtual Redefinion/moins(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  astore 1
  aload 1
  invokevirtual Fact/fact(Ljava/lang/Object;)Ljava/lang/Object;
  astore 1
  aload 0
  aload 1
  invokevirtual Redefinion/mult(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  astore 1
  aload 1
  areturn

.limit locals 2
.limit stack 6
.end method


.method public static main([Ljava/lang/String;)V
  .limit locals 1
  .limit stack 1

  ldc 10
  invokestatic java/lang/Integer.valueOf(I)Ljava/lang/Integer;
  invokestatic Fact/fact(Ljava/lang/Object;)Ljava/lang/Object;
  invokestatic java/io/PrintStream.print(Ljava/lang/Object;)V

  return

.end method
