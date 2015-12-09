package EchoApp;

/**
* EchoApp/EchoHolder.java .
* IDL-to-Java コンパイラ (ポータブル), バージョン "3.1" で生成
* 生成元: echo.idl
* 2015年12月9日 9時57分42秒 JST
*/

public final class EchoHolder implements org.omg.CORBA.portable.Streamable
{
  public EchoApp.Echo value = null;

  public EchoHolder ()
  {
  }

  public EchoHolder (EchoApp.Echo initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = EchoApp.EchoHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    EchoApp.EchoHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return EchoApp.EchoHelper.type ();
  }

}
