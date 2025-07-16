using System;
using System.Collections.Generic;
using System.Text;

namespace SocialMedia.Core.Exeptions
{
  public class BusinessException : Exception
  {
    public BusinessException() { }

    public BusinessException(string message) : base(message) { }
  }
}
