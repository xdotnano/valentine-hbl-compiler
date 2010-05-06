
/**
 * @file Exception.h
 */

/**********************************************************************

  Created: 11 Nov 2005

    Copyright (C) 2005 Frank Buss, J�r�me Laheurte

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. The names of the authors may not be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

**********************************************************************/
// $Id: Exception.h 1468 2005-11-20 12:18:29Z fraca7 $

#ifndef _EXCEPTION_H
#define _EXCEPTION_H

#include <string>

namespace PSP2D
{
    /**
     * Base class  for exceptions  that may be  throwed by  classes in
     * this library.
     */

    class Exception
    {
      public:
       /**
        * Constructor.
        *
        * @param msg: A description of the error.
        */
       Exception(const std::string& msg);

       virtual ~Exception();

       /**
        * Accessor for the message.
        */

       std::string getMessage();

      protected:
       std::string _msg;
    };
};

#endif /* _EXCEPTION_H */
