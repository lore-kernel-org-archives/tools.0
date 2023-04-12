Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FA3C02
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:00:21 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id h193so6231358pgc.6
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681326021; x=1683918021;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XW2LNxCPmHbf4c0hyOFQ++87UtJhQg5KsfKHq0xXxKs=;
        b=qLHvocfsNkGdyXvFeWJu9D5z99eHWDUc2E4ylUR5GpKf2/rav3iU/Dsh3Jbcit15dJ
         cmX3oJsIJ8rRnidmsA/1BVRGqjMO5SRkCUWqjQxgiVHnUyIAC99/hVp5z9YbzsDxjNID
         wueD49taDBwQarn8EDuiwXYlOuGLyxEac7A9QKA0TaCqDXwL2jCVT31OTawp6Jna6SdJ
         syKnsTc8DoEACj7p6s3IetJa6IE1q0o3XJw8cwvKfenYqsjTzgGD3+3FEZWDSoKAmKQ4
         ux2wHpPLp517PkUpOZzEfxwQHdTtD8bN/5WUhaGLAb+pNuFnmTTh6qe6+Zw5DNQ4PZk1
         T1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681326021; x=1683918021;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XW2LNxCPmHbf4c0hyOFQ++87UtJhQg5KsfKHq0xXxKs=;
        b=HNXO4Duvb71YRVJ1UyGJEwQgZfYUkCM82MaNFS9UxZjvqf/UEkbMCssbY1WIy61VTY
         JHBHTMszYQcZj6YArMXqHRE9q1dOHa1jJ12t5hOgC/uY1PX1e1xCYI46Y3qXypSi02dy
         JFdB1X900awg9caEcG5dYIEYP6ck6WiGwSTSt/B7SVR/9bhAYVxhs+ialfaByfOSKfwr
         g101FfeTTwtnAQ2EqDGo6l1fJx2B6INKUjamrV7Ln1Ta6wYnwp+HSNKewkBpeWOcBhJk
         RZe4mbMGWOT0ZMJwjsd7w+dSvnTyHXr9mkEGQP7smv2CnR0YewVKPqEzCIa+z4wyMzz9
         rxxw==
X-Gm-Message-State: AAQBX9cC5q8mhSpXWiUjv7Mg0J6IIE78jHp9T5mjLb0xYfIZqyx4DKxW
	MgdUtlSfgqUCA1tdtjcJqXT8F/0nDoQ7npTPRdAKvg==
X-Google-Smtp-Source: AKy350YdTF1GvXTtZD7xuuUwQUHciuHmbjFvTWvAUxlkfBrwTF+JEAxJ3OUG/zk0luhIGYdHCmTzfN8gLnOlH4MCqjc=
X-Received: by 2002:a63:db47:0:b0:4fc:d6df:85a0 with SMTP id
 x7-20020a63db47000000b004fcd6df85a0mr4955083pgi.1.1681326021135; Wed, 12 Apr
 2023 12:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 12 Apr 2023 12:00:09 -0700
Message-ID: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Subject: executable sendemail.smtpserver and b4 --reflect
To: icon@mricon.com
Cc: tools@linux.kernel.org, mjg59@srcf.ucam.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,
I was following along
https://people.kernel.org/monsieuricon/introducing-b4-and-patch-attestation
eager to try using b4 to send a patch series.  When I got to

$ b4 send --reflect

it seems that my series was sent to the list, surprisingly!
https://lore.kernel.org/llvm/20230412-no_stackp-v1-0-46a69b507a4b@google.com/

Internally at my employer, I must use a command line utility to send
email outside of the blessed GUI.  As such, my ~/.gitconfig looks
like:

...
[user]
        name = Nick Desaulniers
        email = ndesaulniers@google.com
[sendemail]
        from = Nick Desaulniers <ndesaulniers@google.com>
        smtpserver = /usr/bin/sendgmr
...

From a discussion with you and Matthew on IRC, it sounds like this
company-internal sendgmr utility might not be respecting some header
b4 adds to the eml file (envelope-from?)?

I can file a bug internally, but I'm not well versed on how to clarify
precisely what's going wrong.  Is there anything to be done in b4
itself, or help me word such a report I can file internally?

I also noticed that my name wasn't being sent on the From: field to
LKML. I assume that's an orthogonal issue, but is there anything else
I should be doing there?
-- 
Thanks,
~Nick Desaulniers
